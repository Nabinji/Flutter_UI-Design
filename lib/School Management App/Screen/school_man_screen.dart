import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import 'app_home_page.dart';
import 'calendar_screen.dart';

class SchoolManagementScreen extends StatefulWidget {
  const SchoolManagementScreen({super.key});

  @override
  _SchoolManagementScreenState createState() => _SchoolManagementScreenState();
}

class _SchoolManagementScreenState extends State<SchoolManagementScreen> {
  int _selectedItemIndex = 0;
  final List pages = [
    const AppHomePage(),
    const Scaffold(),
    const Scaffold(),
    const CalendarPage(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: kBackground,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(
          color: Colors.blueGrey[600],
          ),
          currentIndex: _selectedItemIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedItemIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.insert_chart),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.done),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.chat_bubble),
            ),
          ],
        ),
        body: pages[_selectedItemIndex],
      ),
    );
  }
}
