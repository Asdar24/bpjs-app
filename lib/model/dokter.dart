// To parse this JSON data, do
//
//     final dokter = dokterFromJson(jsonString);

import 'dart:convert';

List<Dokter> dokterFromJson(String str) =>
    List<Dokter>.from(json.decode(str).map((x) => Dokter.fromJson(x)));

String dokterToJson(List<Dokter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dokter {
  Dokter({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.specialist,
  });

  int id;
  String name;
  String imageUrl;
  String specialist;

  factory Dokter.fromJson(Map<String, dynamic> json) => Dokter(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        specialist: json["specialist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "specialist": specialist,
      };
}
