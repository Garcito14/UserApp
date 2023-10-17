// To parse this JSON data, do
//
//     final usersPostDetail = usersPostDetailFromJson(jsonString);

import 'dart:convert';

List<UsersPostDetail> usersPostDetailFromJson(String str) =>
    List<UsersPostDetail>.from(
        json.decode(str).map((x) => UsersPostDetail.fromJson(x)));

String usersPostDetailToJson(List<UsersPostDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersPostDetail {
  final int userId;
  final int id;
  final String title;
  final String body;

  UsersPostDetail({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UsersPostDetail.fromJson(Map<String, dynamic> json) =>
      UsersPostDetail(
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
