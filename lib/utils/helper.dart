import 'dart:convert';


import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';




showToastMessage(Color color,String message,String title){

return Get.showSnackbar(GetSnackBar(message: message,backgroundColor: color,title: title,duration: const Duration(seconds: 2),));
}

 dynamic handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Successful response
      var res = response.body;
    
      return res;
    }
   else if (response.statusCode == 201) {
      // Successful response
      var res = response.body;
    
      return res;
    } else if (response.statusCode >= 400) {
      // Error response
      showToastMessage(
        Colors.red,
        jsonDecode(response.body)["message"],
        "Error",
      );
      return;
    }else {
      showToastMessage(Colors.red, "Something went Wrong", "Error");
      return;
    }
    
  }

  
