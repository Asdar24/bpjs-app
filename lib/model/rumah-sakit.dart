// To parse this JSON data, do
//
//     final rumahsakit = rumahsakitFromJson(jsonString);

import 'dart:convert';

List<Rumahsakit> rumahsakitFromJson(String str) =>
    List<Rumahsakit>.from(json.decode(str).map((x) => Rumahsakit.fromJson(x)));

String rumahsakitToJson(List<Rumahsakit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rumahsakit {
  Rumahsakit({
    required this.id,
    required this.name,
    required this.rate,
    required this.phone,
    required this.address,
  });

  int id;
  String name;
  String rate;
  String phone;
  String address;

  factory Rumahsakit.fromJson(Map<String, dynamic> json) => Rumahsakit(
        id: json["id"],
        name: json["name"],
        rate: json["rate"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rate": rate,
        "phone": phone,
        "address": address,
      };
}
