import 'package:flutter/material.dart';
import '../Utils/color.dart';
import 'cards_view.dart';
import 'home_view.dart';
import 'spending_budgets_view.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedTab = 0;
  final PageStorageBucket _bucket = PageStorageBucket();
  final List<Widget> _tabs = [
    const HomeView(),
    const SpendingBudgetsView(),
    const Scaffold(),
    const CardsView(),
  ];
  void _onTabSelected(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: Stack(
        children: [
          PageStorage(
            bucket: _bucket,
            child: _tabs[selectedTab],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset("assets/img/bottom_bar_bg.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTabIcon(
                          iconPath: "assets/img/home.png",
                          index: 0,
                        ),
                        _buildTabIcon(
                          iconPath: "assets/img/budgets.png",
                          index: 1,
                        ),
                        const SizedBox(
                          width: 50,
                          height: 50,
                        ),
                        _buildTabIcon(
                          iconPath: "assets/img/calendar.png",
                          index: 2,
                        ),
                        _buildTabIcon(
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
                          width: 55,
                          height: 55,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabIcon({required String iconPath, required int index}) {
    return IconButton(
      onPressed: () => _onTabSelected(index),
      icon: Image.asset(
        iconPath,
        width: 23,
        height: 23,
        color: selectedTab == index ? Colors.white : gray30,
      ),
    );
  }
}
