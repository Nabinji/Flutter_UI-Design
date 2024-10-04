import 'package:hive/hive.dart';

class TodoApp {
  // List to store todo items,
  List todoList = [];

  // Access the Hive box for storing the todo list
  final myBox = Hive.box('todos');

  // Load existing data from the Hive box into the todoList
  void loadData() {
    todoList = myBox.get("TODOLIST");
  }

  // Update the Hive box with the current state of the todoList
  void updateData() {
    myBox.put("TODOLIST", todoList);
  }
}
