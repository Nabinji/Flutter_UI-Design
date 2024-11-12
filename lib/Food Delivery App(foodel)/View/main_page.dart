import 'package:flutter/material.dart';
import '../consts.dart';
import '../Model/bottom_icon_model.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final List slectedePage = [
    const HomePage(),
    const Center(child: Text("Message Page")),
    const Center(child: Text("Explore Page")),
    const Center(child: Text("Profile Page")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      bottomNavigationBar: Container(
        height: 86,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              bottomIcons.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      currentPage == index
                          ? bottomIcons[index].selected
                          : bottomIcons[index].unselected,
                      color: kblack,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        color: kblack,
                        shape: BoxShape.circle,
                      ),
                      width: currentPage == index ? 7 : 0,
                      height: currentPage == index ? 7 : 0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: slectedePage[currentPage],
    );
  }
}
