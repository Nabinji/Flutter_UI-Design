import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Trackizer/Utils/color.dart';
import 'package:flutter_ui_design/Trackizer/View/card_view.dart';
import 'package:flutter_ui_design/Trackizer/View/home_screen_trackizer.dart';
import 'package:flutter_ui_design/Trackizer/View/spending_and_budgets.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  final List<Widget> _tabs = [
    const HomeScreenTrackizer(),
    const SpendingAndBudgets(),
    const Scaffold(),
    const CardView(),
  ];
  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: Stack(
        children: [
          PageStorage(
            bucket: _pageStorageBucket,
            child: _tabs[selectedIndex],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset("assets/img/bottom_bar_bg.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        builldTabIcon(
                          iconPath: "assets/img/home.png",
                          index: 0,
                        ),
                        builldTabIcon(
                          iconPath: "assets/img/budgets.png",
                          index: 1,
                        ),
                        const SizedBox(width: 50, height: 50),
                        builldTabIcon(
                          iconPath: "assets/img/calendar.png",
                          index: 2,
                        ),
                        builldTabIcon(
                          iconPath: "assets/img/creditcards.png",
                          index: 3,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Image.asset(
                          "assets/img/center_btn.png",
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton builldTabIcon({required String iconPath, required int index}) =>
      IconButton(
        onPressed: ()=> onTabSelected(index),
        icon: Image.asset(
          iconPath,
          width: 23,
          height: 23,
          color: selectedIndex == index ? Colors.white : gray30,
        ),
      );
}
