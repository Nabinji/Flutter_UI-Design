import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/pages/app_main_screen.dart';
import '../widgets/button_primary.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/coffee-shop/bg.png',
                height: size.height / 1.3,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 45,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                      title: 'Get Started',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CoffeeAppMainScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
