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