import 'package:get/get.dart';
import 'package:tech_jar/models/user_list.dart';
import 'package:tech_jar/services/database/user_database.dart';
import 'package:tech_jar/services/user_service.dart';

// class UserController extends GetxController{
//   var isLoading=false.obs;
// var userList=<Users>[].obs;

// @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }
//   fetchUsers()async{
//      try {
//        isLoading.value=true;
// userList.value=await UserService.userList();
// isLoading.value=false;
// return userList;
//      } catch (e) {

//      }
//   }
// }

class UserController extends GetxController {
  var isLoading = false.obs;
  var userList = <Users>[].obs; 

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;

      userList.value = await UserService.userList();
      if (userList.isEmpty) {
        UserDatabase.getUsers();
      } else {
        UserDatabase.insertUsers(userList);
      }
      isLoading.value = false;
    } catch (e) {
       userList.value = await UserDatabase.getUsers();
      isLoading.value = false;
      print('Error fetching users: $e');
    }
  }
}
