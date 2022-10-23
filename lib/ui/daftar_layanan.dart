import 'package:bpjs/model/layanan.dart';

import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/ui/rumahsakit.dart';

import 'package:flutter/material.dart';

class daftarlayanan extends StatefulWidget {
  const daftarlayanan({Key? key}) : super(key: key);

  @override
  State<daftarlayanan> createState() => _daftarlayananState();
}

class _daftarlayananState extends State<daftarlayanan> {
  late Future data;
  List<Layanan> datalayanan = [];

  @override
  void initState() {
    data = Layananservice().getLayanan();
    data.then((value) {
      setState(() {
        datalayanan = value;
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Pelayanan",
                      style:
                          TextStyle(color: color1, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: FutureBuilder(
                      future: data,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          if (snapshot.hasError)
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          else
                            return ListView.builder(
                              itemCount: datalayanan.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => rumahsakit(
                                                    idrumahsakit:
                                                        datalayanan[index].id,
                                                    layanan:
                                                        datalayanan[index].name,
                                                  )));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 90,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${datalayanan[index].imageUrl}")),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                blurRadius: 6,
                                                offset: Offset(1, 1))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 10, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              datalayanan[index].name,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "Selanjutnya >",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    letterSpacing: 2),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            );
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
