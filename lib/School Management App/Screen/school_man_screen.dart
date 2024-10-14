import 'package:flutter/material.dart';
import 'package:flutter_ui_design/School%20Management%20App/Screen/app_home_page.dart';
import 'package:flutter_ui_design/School%20Management%20App/Screen/calendar.dart';
import 'package:flutter_ui_design/School%20Management%20App/Utils/colors.dart';

class SchoolManagementScreen extends StatefulWidget {
  const SchoolManagementScreen({super.key});

  @override
  _SchoolManagementScreenState createState() => _SchoolManagementScreenState();
}

class _SchoolManagementScreenState extends State<SchoolManagementScreen> {
  int selectedIndex = 0;
  final List pages = [
    const AppHomePage(),
    const Scaffold(),
    const Scaffold(),
    const CalendarPage(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: kBackground,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
            ),
            label: "",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
