// To parse this JSON data, do
//
//     final detailKontakResponse = detailKontakResponseFromJson(jsonString);

import 'dart:convert';

DetailKontakResponse detailKontakResponseFromJson(String str) => DetailKontakResponse.fromJson(json.decode(str));

String detailKontakResponseToJson(DetailKontakResponse data) => json.encode(data.toJson());

class DetailKontakResponse {
    DetailKontakResponse({
        required this.id,
        required this.name,
        required this.phone,
    });

    int id;
    String name;
    String phone;

    factory DetailKontakResponse.fromJson(Map<String, dynamic> json) => DetailKontakResponse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
