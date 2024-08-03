import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_jar/models/user_list.dart';
import 'package:tech_jar/utils/endpoints.dart';
import 'package:tech_jar/utils/helper.dart';

class UserService{


static Future<dynamic> userList()async{

  try {
    final response=await  http.get(Uri.parse(EndPoints.usersUrl));
     List<Users> responseList = [];
      var res = handleResponse(response);
      if (res != null) {
        for (var element in jsonDecode(res)) {
          Users users = Users.fromJson(element);
          responseList.add(users);
        }
        return responseList;
      } else {
        return;
      }
  } catch (e) {
    debugPrint(e.toString());
  }
}
}