import 'dart:convert';

List<ListkontakResponse> listkontakResponseFromJson(String str) =>
    List<ListkontakResponse>.from(
      json.decode(str).map(
            (x) => ListkontakResponse.fromJson(x),
          ),
    );

String listkontakResponseToJson(List<ListkontakResponse> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x.toJson(),
        ),
      ),
    );

class ListkontakResponse {
  ListkontakResponse({
     this.id,
     this.name,
     this.phone,
  });

  int? id;
  String? name;
  String? phone;

  factory ListkontakResponse.fromJson(Map<String, dynamic> json) =>
      ListkontakResponse(
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
