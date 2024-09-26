import 'package:flutter/material.dart';
import 'home_screen_grocery.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentMenu = 0;

  final List<Widget> pages = [
    const HomeScreenGrocery(),
    const Center(child: Text('Data')),
    const HomeScreenGrocery(),
    const Center(child: Text('Message')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentMenu],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentMenu,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentMenu = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
