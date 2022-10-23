import 'package:bpjs/model/login.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/shared/shared_preferences.dart';
import 'package:bpjs/ui/login.dart';
import 'package:bpjs/ui/menu_layanan.dart';
import 'package:bpjs/ui/riwayatpesanan.dart';
import 'package:flutter/material.dart';

class pesanlayanan extends StatefulWidget {
  final int idpesan;
  final int iddokterr;
  final int idwaktud;
  final layanan;
  final dokter;
  final rs;
  final day;
  final awal;
  final akhir;
  const pesanlayanan(
      {Key? key,
      required this.idpesan,
      this.layanan,
      this.dokter,
      this.rs,
      this.day,
      this.awal,
      this.akhir,
      required this.iddokterr,
      required this.idwaktud});

  @override
  State<pesanlayanan> createState() => _pesanlayananState();
}

class _pesanlayananState extends State<pesanlayanan> {
  String idUser = SharedPreference.loginUser.getString('id');
  String nokartuUser = SharedPreference.loginUser.getString('bpjs_number');
  String nameUser = SharedPreference.loginUser.getString('name');
  String nikUser = SharedPreference.loginUser.getString('nik');
  String birthdayUser = SharedPreference.loginUser.getString('birthday');

  AntrianService antiran = AntrianService();

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Pesan Layanan",
                style: TextStyle(
                    color: color1, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: 625,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: Offset(1, 1))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 20, left: 20, bottom: 10),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/image/bg2.png'),
                          Image.asset('assets/image/bg2.png'),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Identitas Diri',
                                style: TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            Text(
                              'No Kartu',
                              style: TextStyle(
                                  color: color1, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                height: 30,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: color1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 6, 0, 0),
                                  child: Text(nokartuUser.toString()),
                                )),
                          ],
                        ),
                        modelpesan(
                            nama2: 'Nama Peserta', nama: nameUser.toString()),
                        modelpesan(nama2: 'NIK', nama: nikUser.toString()),
                        modelpesan(
                            nama2: 'Tanggal Lahir', nama: '$birthdayUser'),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: MySeparator(
                            color: Colors.grey,
                            height: 2,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Pelayanan',
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        modelpesan(nama2: 'Layanan', nama: widget.layanan),
                        modelpesan(nama2: 'Rumah Sakit', nama: widget.rs),
                        modelpesan(nama2: 'Dokter', nama: widget.dokter),
                        modelpesan(
                            nama2: 'Waktu',
                            nama:
                                '${widget.day} ( ${widget.awal} - ${widget.akhir} )'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style:
                                    ElevatedButton.styleFrom(primary: color1),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Batal")),
                            SizedBox(width: 10),
                            ElevatedButton(
                                style:
                                    ElevatedButton.styleFrom(primary: color1),
                                onPressed: () async {
                                  bool response = await AntrianService()
                                      .postAntrian(
                                          idUser,
                                          widget.idwaktud.toString(),
                                          widget.iddokterr.toString(),
                                          widget.idpesan.toString());
                                  if (response) {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Pengambilan nomor antrian berhasil',
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: color1),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          menulayanan(),
                                                    ));
                                              },
                                              child: const Text('Selesai'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Anda sudah terdaftar',
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: color1),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Selesai'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Text("Simpan"))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
