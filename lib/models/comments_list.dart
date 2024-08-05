// To parse this JSON data, do
//
//     final comments = commentsFromJson(jsonString);

import 'dart:convert';

List<Comments> commentsFromJson(String str) {
    final jsonData = json.decode(str);
    return List<Comments>.from(jsonData.map((x) => Comments.fromJson(x)));
}

String commentsToJson(List<Comments> data) {
    final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Comments {
    int? postId;
    int? id;
    String? name;
    String? email;
    String? body;

    Comments({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        postId: json["postId"] as int?,
        id: json["id"] as int?,
        name: json["name"] as String?,
        email: json["email"] as String?,
        body: json["body"] as String?,
    );

    Map<String, dynamic> toJson() => {
        "postId": postId ?? 0,
        "id": id ?? 0,
        "name": name ?? "",
        "email": email ?? "",
        "body": body ?? "",
    };
}
