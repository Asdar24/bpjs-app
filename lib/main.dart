import 'dart:convert';
import 'package:bpjs/ui/daftar_layanan.dart';
import 'package:bpjs/ui/daftar_riwayat.dart';
import 'package:bpjs/ui/login.dart';
import 'package:bpjs/ui/menu_dokter.dart';
import 'package:bpjs/ui/menu_layanan.dart';
import 'package:bpjs/ui/pesan_layanan.dart';
import 'package:bpjs/ui/riwayatpesanan.dart';
import 'package:bpjs/ui/rumahsakit.dart';
import 'package:bpjs/ui/waktu.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
