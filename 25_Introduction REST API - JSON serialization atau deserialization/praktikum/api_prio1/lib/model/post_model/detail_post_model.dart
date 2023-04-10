// To parse this JSON data, do
//
//     final detailPostResponse = detailPostResponseFromJson(jsonString);

import 'dart:convert';

DetailPostResponse detailPostResponseFromJson(String str) => DetailPostResponse.fromJson(json.decode(str));

String detailPostResponseToJson(DetailPostResponse data) => json.encode(data.toJson());

class DetailPostResponse {
    DetailPostResponse({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory DetailPostResponse.fromJson(Map<String, dynamic> json) => DetailPostResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
