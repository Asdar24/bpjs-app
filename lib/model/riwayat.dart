// To parse this JSON data, do
//
//     final riwayat = riwayatFromJson(jsonString);

import 'dart:convert';

List<Riwayat> riwayatFromJson(String str) =>
    List<Riwayat>.from(json.decode(str).map((x) => Riwayat.fromJson(x)));

String riwayatToJson(List<Riwayat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Riwayat {
  Riwayat({
    required this.id,
    required this.pasien,
    required this.nomorKartu,
    required this.nomorAntrian,
    required this.tanggallahir,
    required this.nik,
    required this.rumahSakit,
    required this.layanan,
    required this.namaDokter,
    required this.hari,
    required this.mulaiJam,
    required this.sampaiJam,
    required this.status,
    required this.isReviewed,
  });

  int id;
  String pasien;
  String nomorKartu;
  String nomorAntrian;
  String tanggallahir;
  String nik;
  String rumahSakit;
  String layanan;
  String namaDokter;
  String hari;
  String mulaiJam;
  String sampaiJam;
  String status;
  String isReviewed;

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        id: json["id"],
        pasien: json["pasien"],
        nomorKartu: json["nomor_kartu"],
        nomorAntrian: json["nomor_antrian"],
        tanggallahir: json["tanggal_lahir"],
        nik: json["nik"],
        rumahSakit: json["rumah_sakit"],
        layanan: json["layanan"],
        namaDokter: json["nama_dokter"],
        hari: json["hari"],
        mulaiJam: json["mulai_jam"],
        sampaiJam: json["sampai_jam"],
        status: json["status"],
        isReviewed: json["is_reviewed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pasien": pasien,
        "nomor_kartu": nomorKartu,
        "nomor_antrian": nomorAntrian,
        "tanggal_lahir": tanggallahir,
        "nik": nik,
        "rumah_sakit": rumahSakit,
        "layanan": layanan,
        "nama_dokter": namaDokter,
        "hari": hari,
        "mulai_jam": mulaiJam,
        "sampai_jam": sampaiJam,
        "status": status,
        "is_reviewed": isReviewed,
      };
}
