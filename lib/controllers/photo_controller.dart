import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tech_jar/models/photo_list.dart';
import 'package:tech_jar/services/photo_service.dart';

class PhotoController extends GetxController {
  var isLoading = false.obs;
  var photoList = <Photos>[].obs;

  @override
  void onInit() {
    fetchPhotos();
    super.onInit();
  }

  fetchPhotos() async {
    try {
      isLoading.value = true;
      photoList.value = await PhotoService.photoList();
      isLoading.value = false;
      if (photoList.isNotEmpty) {
        return photoList;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
