import 'package:get/get.dart';
import 'package:tech_jar/models/user_list.dart';
import 'package:tech_jar/services/user_service.dart';

class UserController extends GetxController{
  var isLoading=false.obs;
var userList=<Users>[].obs;


@override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
  fetchUsers()async{
     try {
       isLoading.value=true;
userList.value=await UserService.userList();
isLoading.value=false;
return userList;
     } catch (e) {
       
     }
  }
}




// class UserController extends GetxController {
//   var isLoading = false.obs;
//   var userList = <Users>[].obs; // Ensure this matches your User model

//   final DatabaseHelper _dbHelper = DatabaseHelper();

//   @override
//   void onInit() {
//     fetchUsers();
//     super.onInit();
//   }

//   Future<void> fetchUsers() async {
//     try {
//       isLoading.value = true;

//       userList.value = await _dbHelper.getUsers();
//       if (userList.isEmpty) {
//         var users = await UserService.userList();
//         if (users != null) {
//           users.value = users;
//           for (var user in users) {
//             await _dbHelper.insertUser(user);
//           }
//         }
//       }
//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       print('Error fetching users: $e');
//     }
//   }
// }
