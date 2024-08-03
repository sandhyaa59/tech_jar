import 'package:get/get.dart';
import 'package:tech_jar/models/todos.dart';
import 'package:tech_jar/services/todo_service.dart';

class TodoController extends GetxController{
  var isLoading=false.obs;
var todoList=<Todos>[].obs;

@override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
  fetchUsers()async{
     try {
       isLoading.value=true;
todoList.value=await TodoService.todoList();
isLoading.value=false;
return todoList;
     } catch (e) {
       
     }
  }
}