import 'package:bpjs/model/login.dart';
import 'package:bpjs/modelclass.dart';
import 'package:bpjs/shared/shared_preferences.dart';
import 'package:bpjs/ui/daftar_layanan.dart';
import 'package:bpjs/ui/daftar_riwayat.dart';
import 'package:bpjs/ui/login.dart';

import 'package:bpjs/ui/riwayatpesanan.dart';
import 'package:flutter/material.dart';

class menulayanan extends StatefulWidget {
  const menulayanan({
    Key? key,
  }) : super(key: key);

  @override
  State<menulayanan> createState() => _menulayananState();
}

class _menulayananState extends State<menulayanan> {
  String idUser = SharedPreference.loginUser.getString('id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Apakah anda ingin keluar?',
                    textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: color1),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('tidak'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: color1),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login(),
                            ));
                      },
                      child: const Text('iya'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.output)),
        centerTitle: true,
        backgroundColor: color1,
        title: Text("Layanan"),
      ),
      body: Stack(
        children: [
          Center(child: Image.asset('assets/image/bg.png')),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33, vertical: 14),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Menu Pelayanan",
                    style:
                        TextStyle(color: color1, fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => daftarlayanan(),
                          ));
                    },
                    child: buttonmenu(titlebutton: "Tambah Layanan")),
                InkWell(
                  child: buttonmenu(titlebutton: "Riwayat Layanan"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => daftarriwayat(
                                  idriwayat: int.parse(idUser),
                                )));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
