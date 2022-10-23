import 'package:bpjs/modelclass.dart';
import 'package:bpjs/service/service.dart';
import 'package:bpjs/shared/shared_preferences.dart';
import 'package:bpjs/ui/daftar_layanan.dart';
import 'package:bpjs/ui/dialog.dart';
import 'package:bpjs/ui/menu_layanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class riwayatpesanan extends StatefulWidget {
  final pasien;
  final tgllahir;
  final idantri;
  final layanan;
  final nama_dokter;
  final hari;
  final mulai_jam;
  final sampai_jam;
  final rumahsakit;
  final nokartu;
  final noantrian;
  final nik;
  final status;

  const riwayatpesanan({
    Key? key,
    this.pasien,
    this.layanan,
    this.nama_dokter,
    this.hari,
    this.mulai_jam,
    this.sampai_jam,
    this.rumahsakit,
    this.nokartu,
    this.noantrian,
    this.nik,
    this.idantri,
    this.tgllahir,
    this.status,
  }) : super(key: key);

  @override
  State<riwayatpesanan> createState() => _riwayatpesananState();
}

class _riwayatpesananState extends State<riwayatpesanan> {
  String idUser = SharedPreference.loginUser.getString('id');
  TextEditingController ComentC = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color1,
        title: Text("Layanan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: 758,
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
                          Image.asset('assets/image/bg.png'),
                          Image.asset('assets/image/bg.png'),
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
                                widget.layanan,
                                style: TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  'Nomor Antrian Anda',
                                  style: TextStyle(
                                      color: color1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                widget.noantrian,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: MySeparator(
                                color: Colors.grey,
                                height: 2,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Identitas',
                                style: TextStyle(
                                    color: color1,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                            modelpesan(
                                nama: widget.nokartu, nama2: 'Nomor Kartu')
                          ],
                        ),
                        modelpesan(nama: widget.pasien, nama2: 'Nama Peserta'),
                        modelpesan(nama: widget.nik, nama2: 'NIK'),
                        modelpesan(
                            nama: widget.tgllahir, nama2: 'Tanggal Lahir'),
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
                        modelpesan(nama: widget.layanan, nama2: 'Layanan'),
                        modelpesan(
                            nama: widget.rumahsakit, nama2: 'Rumah sakit'),
                        modelpesan(nama: widget.nama_dokter, nama2: 'Dokter'),
                        modelpesan(
                            nama2: 'Waktu',
                            nama:
                                '${widget.hari} ( ${widget.mulai_jam} - ${widget.sampai_jam} )'),
                        Center(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: color1),
                          onPressed: () {
                            widget.status == 'wait'
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => menulayanan(),
                                    ))
                                : showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                          height: 360,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Beri Penilain",
                                                  style: TextStyle(
                                                      color: color1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  widget.rumahsakit,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(height: 10),
                                                RatingBar.builder(
                                                  initialRating: rating,
                                                  itemSize: 60,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate:
                                                      (double ratingg) {
                                                    this.rating = ratingg;
                                                    print(this.rating.toInt());
                                                    setState(() {});
                                                  },
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Cerita Pengalaman Anda",
                                                  style: TextStyle(
                                                      color: color1,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: TextFormField(
                                                    controller: ComentC,
                                                    minLines: 3,
                                                    maxLines: 5,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Yuk ceritakan pengalaman anda selama dirumah sakit ini',
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary: color1),
                                                      onPressed: () async {
                                                        setState(() {});
                                                        bool responses =
                                                            await UlasService()
                                                                .postUlas(
                                                                    rating
                                                                        .toInt(),
                                                                    ComentC
                                                                        .text,
                                                                    widget
                                                                        .idantri);

                                                        if (responses) {
                                                          showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              title: const Text(
                                                                'Terimah Kasih Ratingnya :)',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              actions: <Widget>[
                                                                Center(
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary:
                                                                            color1),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                menulayanan(),
                                                                          ));
                                                                    },
                                                                    child: const Text(
                                                                        'Selesai'),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          showDialog<String>(
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              title: const Text(
                                                                'Upss anda sudah melakukan rating sebelumnya',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              actions: <Widget>[
                                                                Center(
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary:
                                                                            color1),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                menulayanan(),
                                                                          ));
                                                                    },
                                                                    child: const Text(
                                                                        'Selesai'),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child: Text("kirim")),
                                                )
                                              ],
                                            ),
                                          ));
                                    });
                          },
                          child: const Text('Kembali'),
                        ))
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
