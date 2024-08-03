// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) {
    final jsonData = json.decode(str);
    return  List<Photos>.from(jsonData.map((x) => Photos.fromJson(x)));
}

String photosToJson(List<Photos> data) {
    final dyn =  List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class Photos {
    int? albumId;
    int? id;
    String? title;
    String? url;
    String? thumbnailUrl;

    Photos({
        this.albumId,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    factory Photos.fromJson(Map<String, dynamic> json) =>  Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
