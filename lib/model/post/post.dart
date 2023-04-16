import 'package:village/model/user/user.dart';

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
        user: User.fromJson(json["user"]), // 오브젝트를 넣어줌
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
        "user": user?.toJson(), // null 이 아닐때 메소드 접근
      };
}
