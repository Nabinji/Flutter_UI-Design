import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Travel-Mobile-App/const.dart';
import 'package:flutter_ui_design/Travel-Mobile-App/models/onboard_model.dart';

import 'travel_home_screen.dart';

class TravelOnBoardingScreen extends StatefulWidget {
  const TravelOnBoardingScreen({super.key});

  @override
  State<TravelOnBoardingScreen> createState() => _TravelOnBoardingScreenState();
}

class _TravelOnBoardingScreenState extends State<TravelOnBoardingScreen> {
  int currentIndex = 0;
  Widget dotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(right: 6),
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index == currentIndex ? Colors.white : Colors.white54,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) => setState(
              () => currentIndex = value,
            ),
            itemCount: onboarding.length,
            itemBuilder: (context, index) {
              return Image.network(
                onboarding[index].image,
                fit: BoxFit.cover,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TravelHomeScreen(),
                            ),
                            (route) => false);
                      },
                      child: Visibility(
                        visible: onboarding.length - 1 != currentIndex
                            ? true
                            : false,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white54,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onboarding[currentIndex].name,
                          style: const TextStyle(
                            fontSize: 70,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'We Travelin are ready to help you on\nvacation around Nepal',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 245,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboarding.length, dotIndicator),
                  ),
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(35),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TravelHomeScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: Container(
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Colors.black12,
                                    spreadRadius: 15,
                                    blurRadius: 15,
                                  )
                                ],
                                color: kButtonColor,
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Let's Get Started",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'already have account? ',
                                  style: TextStyle(
                                    color: kButtonColor,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
