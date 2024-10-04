import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'To Do App/todo_screen.dart';

void main() async {
  // Ensure all widgets are initialized before starting the app
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive in the Flutter environment
  await Hive.initFlutter();
  // Open a Hive box to store the todo list
  await Hive.openBox("todos");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}













// for hive database
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await Hive.openBox("Box");
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HiveDatabaseFlutter(),
//     );
//   }
// }
