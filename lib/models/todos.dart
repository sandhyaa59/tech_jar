// To parse this JSON data, do
//
//     final todos = todosFromJson(jsonString);

import 'dart:convert';

List<Todos> todosFromJson(String str) {
    final jsonData = json.decode(str);
    return  List<Todos>.from(jsonData.map((x) => Todos.fromJson(x)));
}

String todosToJson(List<Todos> data) {
    final dyn =  List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Todos {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    Todos({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory Todos.fromJson(Map<String, dynamic> json) =>  Todos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
