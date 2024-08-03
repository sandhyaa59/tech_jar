import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tech_jar/models/todos.dart';
import 'package:tech_jar/utils/endpoints.dart';
import 'package:tech_jar/utils/helper.dart';

class TodoService{


static Future<dynamic> todoList()async{

  try {
    final response=await  http.get(Uri.parse(EndPoints.todosUrl));
     List<Todos> responseList = [];
      var res = handleResponse(response);
      if (res != null) {
        for (var element in jsonDecode(res)) {
          Todos todos = Todos.fromJson(element);
          responseList.add(todos);
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