import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Maker/Models/onboard_model.dart';
import 'package:flutter_ui_design/Coffee%20Maker/Views/coffee_home_screen.dart';
import 'package:flutter_ui_design/Coffee%20Maker/consts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          PageView.builder(
              itemCount: onBoards.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        onBoards[index].onboardingImage,
                        width: size.width,
                        height: 750,
                      ),
                    )
                  ],
                );
              }),
          Positioned(
            left: 30,
            right: 30,
            top: 70,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onBoards.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey.withOpacity(0.5),
                        activeDotColor: Colors.orange,
                        spacing: 5,
                        dotWidth: 15,
                        dotHeight: 5,
                        expansionFactor: 2,
                        radius: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CoffeeHomeScreen(),
                            ),
                            (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Text(
                  onBoards[currentPage].title,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  onBoards[currentPage].subTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
