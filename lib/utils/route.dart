import 'package:get/route_manager.dart';
import 'package:tech_jar/screens/photo_screen.dart';
import 'package:tech_jar/screens/post_detail_screen.dart';
import 'package:tech_jar/screens/post_list_screen.dart';
import 'package:tech_jar/screens/todo_screen.dart';
import 'package:tech_jar/screens/users_screen.dart';
import 'package:tech_jar/utils/bindings.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        transition: Transition.fadeIn,
        name: Routes.POST_LIST,
        page: () => PostListScreen(),
        binding: PostListBinding()),
    GetPage(
        name: Routes.POST_DETAIL,
        transition: Transition.fadeIn,
        page: () => PostDetailScreen(),
        binding: PostDetailBinding()),
    GetPage(
        name: Routes.USER_LIST,
        transition: Transition.fadeIn,
        page: () => UserScreen(),
        binding: UserBinding()),
    GetPage(
        name: Routes.PHOTO,
        page: () => PhotosScreen(),
        transition: Transition.fadeIn,
        binding: PhotoBinding()),
    GetPage(
        name: Routes.TODO,
        page: () => TodoScreen(),
        transition: Transition.fadeIn,
        binding: TodoBinding())
  ];
}

class Routes {
  static const String INITIAL_LOAD = "/post-list";
  static const String USER_LIST = "/user-list";
  static const String POST_LIST = "/post-list";
  static const String POST_DETAIL = "/post-detail";
  static const String PHOTO = "/photo-list";
  static const String TODO = "/todo-list";
}
