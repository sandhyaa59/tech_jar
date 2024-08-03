import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_jar/models/photo_list.dart';
import 'package:tech_jar/utils/endpoints.dart';
import 'package:tech_jar/utils/helper.dart';

class PhotoService {
  static Future<dynamic> photoList() async {
    try {
      final response = await http.get(Uri.parse(EndPoints.photosUrl));
      List<Photos> responseList = [];
      var res = handleResponse(response);

      if (res != null) {
        for (var element in jsonDecode(res)) {
          Photos photos = Photos.fromJson(element);
          responseList.add(photos);
        }
        return responseList;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching photo list: $e');
      return null;
    }
  }
}
