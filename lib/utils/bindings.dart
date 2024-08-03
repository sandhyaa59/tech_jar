import 'package:get/get.dart';
import 'package:tech_jar/controllers/photo_controller.dart';
import 'package:tech_jar/controllers/post_controller.dart';
import 'package:tech_jar/controllers/todo_controller.dart';
import 'package:tech_jar/controllers/user_controller.dart';

class PostListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
  }
}

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
  }
}


class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}


class PhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoController());
  }
}


class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
