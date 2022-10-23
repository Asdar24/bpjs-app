import 'dart:convert';

List<Layanan> layananFromJson(String str) =>
    List<Layanan>.from(json.decode(str).map((x) => Layanan.fromJson(x)));

String layananToJson(List<Layanan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Layanan {
  Layanan({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  int id;
  String name;
  String imageUrl;

  factory Layanan.fromJson(Map<String, dynamic> json) => Layanan(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
      };
}
