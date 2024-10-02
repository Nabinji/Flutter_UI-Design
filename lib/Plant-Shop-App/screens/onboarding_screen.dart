import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Plant-Shop-App/constants.dart';
import 'package:flutter_ui_design/Plant-Shop-App/models/onbording_model.dart';
import 'package:flutter_ui_design/Plant-Shop-App/screens/plants_home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          if (currentIndex < pOnBording.length - 1)
            // skip button is not display in last index of onbordin
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PlantsHomeScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey.shade800,
              ),
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
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
                controller: controller,
                onPageChanged: (value) => setState(() {
                  currentIndex = value;
                }),
                itemCount: pOnBording.length,
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
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: pOnBording[index].title,
                                style: const TextStyle(
                                  fontSize: 45,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const TextSpan(
                                text: " Plants",
                                style: TextStyle(
                                  color: Colors.black,
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
                        builder: (_) => const PlantsHomeScreen(),
                      ),
                    );
                  } else {
                    await controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                }, 
                child: const CircleAvatar(
                  backgroundColor: primaryColor,
                  radius: 50,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
