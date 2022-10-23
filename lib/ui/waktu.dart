import 'package:bpjs/model/data_waktu.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/ui/pesan_layanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class waktu extends StatefulWidget {
  final int idwaktud;
  final int iddokterr;
  final layanan;
  final dokter;
  final rs;
  const waktu(
      {Key? key,
      required this.idwaktud,
      this.layanan,
      this.dokter,
      this.rs,
      required this.iddokterr})
      : super(key: key);

  @override
  State<waktu> createState() => _waktuState();
}

class _waktuState extends State<waktu> {
  late Future data;
  List<Waktu> dataWaktu = [];

  @override
  void initState() {
    data = Waktuservice().getwaktu(widget.idwaktud);
    data.then((value) {
      setState(() {
        dataWaktu = value;
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      "Pilih Waktu",
                      style:
                          TextStyle(color: color1, fontWeight: FontWeight.bold),
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
                            itemCount: dataWaktu.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => pesanlayanan(
                                          iddokterr: widget.iddokterr,
                                          idwaktud: widget.idwaktud,
                                          idpesan: dataWaktu[index].id,
                                          akhir: dataWaktu[index].until,
                                          awal: dataWaktu[index].start,
                                          dokter: widget.dokter,
                                          day: dataWaktu[index].day,
                                          layanan: widget.layanan,
                                          rs: widget.rs,
                                        ),
                                      ));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  height: 70,
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(dataWaktu[index].day,
                                                style: TextStyle(
                                                    color: color1,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                'Pukul ${dataWaktu[index].start} - ${dataWaktu[index].until}',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                        Text(
                                            '${dataWaktu[index].quota} / ${dataWaktu[index].maxQuota}',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: color1,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
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
