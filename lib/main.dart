import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/View/onboard_page.dart';
import 'package:provider/provider.dart';

import 'Food Delivery App(foodel)/Provider/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root widget of the app
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardPage(),
      ),
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
