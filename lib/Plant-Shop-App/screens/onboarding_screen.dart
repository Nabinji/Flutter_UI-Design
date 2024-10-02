import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/onbording_model.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          if (currentIndex < pOnBording.length - 1) // Conditionally show Skip
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade800,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlantsHomeScreen(),
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 17, color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 630,
              child: PageView.builder(
                controller: pageController,
                itemCount: pOnBording.length,
                onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        pOnBording[index].image,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          pOnBording.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 4),
                            width: index == currentIndex ? 18 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == currentIndex
                                  ? primaryColor
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: pOnBording[index].title1,
                                style: const TextStyle(
                                  fontSize: 45,
                                  height: 1,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const TextSpan(
                                text: " Plants",
                                style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () async {
                  if (currentIndex == (pOnBording.length - 1)) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlantsHomeScreen(),
                      ),
                    );
                  } else {
                    await pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: const CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 50,
                  child: Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
