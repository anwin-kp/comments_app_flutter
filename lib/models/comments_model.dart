import 'dart:convert';

class CommentsModel {
    final int? postId;
    final int? id;
    final String? name;
    final String? email;
    final String? body;

    CommentsModel({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    factory CommentsModel.fromRawJson(String str) => CommentsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
