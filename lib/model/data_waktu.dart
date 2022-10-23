// To parse this JSON data, do
//
//     final waktu = waktuFromJson(jsonString);

import 'dart:convert';

List<Waktu> waktuFromJson(String str) =>
    List<Waktu>.from(json.decode(str).map((x) => Waktu.fromJson(x)));

String waktuToJson(List<Waktu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Waktu {
  Waktu({
    required this.id,
    required this.doctorId,
    required this.day,
    required this.start,
    required this.until,
    required this.maxQuota,
    required this.quota,
  });

  int id;
  int doctorId;
  String day;
  String start;
  String until;
  int maxQuota;
  int quota;

  factory Waktu.fromJson(Map<String, dynamic> json) => Waktu(
        id: json["id"],
        doctorId: json["doctor_id"],
        day: json["day"],
        start: json["start"],
        until: json["until"],
        maxQuota: json["max_quota"],
        quota: json["quota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "day": day,
        "start": start,
        "until": until,
        "max_quota": maxQuota,
        "quota": quota,
      };
}
