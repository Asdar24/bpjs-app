import 'package:bpjs/model/riwayat.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/ui/riwayatpesanan.dart';
import 'package:flutter/material.dart';

class daftarriwayat extends StatefulWidget {
  final int? idriwayat;
  const daftarriwayat({Key? key, this.idriwayat}) : super(key: key);

  @override
  State<daftarriwayat> createState() => _daftarriwayatState();
}

class _daftarriwayatState extends State<daftarriwayat> {
  late Future data;
  List<Riwayat> datariwayat = [];

  @override
  void initState() {
    data = Riwayatservice().getriwayat(widget.idriwayat);
    data.then((value) {
      setState(() {
        datariwayat = value;
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
                      "Riwayat Pelayanan",
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
                              itemCount: datariwayat.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => riwayatpesanan(
                                                status:
                                                    datariwayat[index].status,
                                                tgllahir: datariwayat[index]
                                                    .tanggallahir,
                                                idantri: datariwayat[index].id,
                                                nik: datariwayat[index].nik,
                                                noantrian: datariwayat[index]
                                                    .nomorAntrian,
                                                nokartu: datariwayat[index]
                                                    .nomorKartu,
                                                rumahsakit: datariwayat[index]
                                                    .rumahSakit,
                                                hari: datariwayat[index].hari,
                                                layanan:
                                                    datariwayat[index].layanan,
                                                mulai_jam:
                                                    datariwayat[index].mulaiJam,
                                                nama_dokter: datariwayat[index]
                                                    .namaDokter,
                                                sampai_jam: datariwayat[index]
                                                    .sampaiJam,
                                                pasien:
                                                    datariwayat[index].pasien),
                                          ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 70,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              datariwayat[index].layanan,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: color1,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "Selanjutnya >",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
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
