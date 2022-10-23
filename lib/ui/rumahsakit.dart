import 'package:bpjs/model/rumah-sakit.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';

import 'package:bpjs/ui/menu_dokter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rumahsakit extends StatefulWidget {
  final int idrumahsakit;
  final layanan;

  const rumahsakit({Key? key, required this.idrumahsakit, this.layanan})
      : super(key: key);

  @override
  State<rumahsakit> createState() => _rumahsakitState();
}

class _rumahsakitState extends State<rumahsakit> {
  late Future data;
  List<Rumahsakit> dataprov1 = [];
  TextEditingController searchcontroller = TextEditingController();
  bool issearching = false;

  @override
  void initState() {
    data = Rumahsakitservice().getrumahsakit(widget.idrumahsakit);
    data.then((value) {
      setState(() {
        dataprov1 = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        backgroundColor: color1,
        title: Text("Layanan"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Pilih Rumah Sakit",
                      style:
                          TextStyle(color: color1, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Cari Rumah Sakit",
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: data,
                    builder: (context, snapshot) {
                      // AsyncSnapshot<Your object type>
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasError)
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        else
                          return ListView.builder(
                            itemCount: dataprov1.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => dokter1(
                                                iddokter: dataprov1[index].id,
                                                iddokterr: widget.idrumahsakit,
                                                rs: dataprov1[index].name,
                                                layanan: widget.layanan,
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  height: 110,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 6,
                                            offset: Offset(1, 1))
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 55,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: color1,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(15)),
                                        ),
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    dataprov1[index].name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        dataprov1[index].rate),
                                                    itemSize: 19,
                                                    ignoreGestures: true,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Flexible(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(Icons.home,
                                                        color: color1),
                                                    Flexible(
                                                      child: Text(
                                                        dataprov1[index]
                                                            .address,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(Icons.phone,
                                                      color: color1),
                                                  Text(dataprov1[index].phone,
                                                      style: TextStyle(
                                                          fontSize: 13))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
