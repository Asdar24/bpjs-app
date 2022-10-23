// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility that Flutter provides. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:bpjs/model/layanan.dart';
// import 'package:bpjs/model/rumah_sakit.dart';
// import 'package:http/http.dart' as http;

// class Layananservice {
//   static final String _baseUrl = 'http://127.0.0.1:8000/api/layanan';

//   Future getLayanan() async {
//     Uri urlApi = Uri.parse(_baseUrl);

//     final response = await http.get(urlApi);
//     if (response.statusCode == 200) {
//       print(response.body.toString());
//       return layananFromJson(response.body.toString());
//     } else {
//       throw Exception("Failed to load data layanan");
//     }
//   }
// }
