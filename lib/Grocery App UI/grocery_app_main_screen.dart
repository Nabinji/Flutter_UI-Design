import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Grocery%20App%20UI/Views/grocery_home_page.dart';
import 'package:iconsax/iconsax.dart';

class GroceryAppMainPage extends StatefulWidget {
  const GroceryAppMainPage({super.key});

  @override
  State<GroceryAppMainPage> createState() => _GroceryAppMainPageState();
}

class _GroceryAppMainPageState extends State<GroceryAppMainPage> {
  int selectedIndex = 0;
  final List pages = [
    const GroceryHomePage(),
    const Scaffold(
      body: Center(child: Text("Favorite")),
    ),
    const Scaffold(
      body: Center(child: Text("Cart")),
    ),
    const Scaffold(
      body: Center(child: Text("Profile")),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            activeIcon: Icon(Iconsax.home5),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Iconsax.heart5),
            icon: Icon(Iconsax.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Iconsax.shopping_cart5),
            icon: Icon(Iconsax.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
