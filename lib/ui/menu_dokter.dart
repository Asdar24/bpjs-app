import 'package:bpjs/model/dokter.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/ui/waktu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class dokter1 extends StatefulWidget {
  final int iddokter;
  final int iddokterr;
  final layanan;
  final rs;
  const dokter1(
      {Key? key,
      required this.iddokter,
      this.layanan,
      this.rs,
      required this.iddokterr})
      : super(key: key);

  @override
  State<dokter1> createState() => _dokter1State();
}

class _dokter1State extends State<dokter1> {
  late Future data;
  List<Dokter> datadokter = [];
  TextEditingController searchcontroller = TextEditingController();
  bool issearching = false;
  var color1 = Color(0xff1F469F);
  @override
  void initState() {
    data = Dokterservice().getdokter(widget.iddokter);
    data.then((value) {
      setState(() {
        datadokter = value;
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
                      "Pilih Dokter",
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
                          labelText: "Cari Dokter",
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
                            itemCount: datadokter.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => waktu(
                                                iddokterr: widget.iddokterr,
                                                idwaktud: datadokter[index].id,
                                                dokter: datadokter[index].name,
                                                layanan: widget.layanan,
                                                rs: widget.rs,
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
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                              datadokter[index].imageUrl),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(datadokter[index].name,
                                                style: TextStyle(
                                                    color: color1,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(datadokter[index].specialist,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
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
