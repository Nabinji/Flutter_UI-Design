import 'package:flutter/material.dart';
import '../consts.dart';
import 'food_delivery_home.dart';

class MyOnBoardPage extends StatefulWidget {
  const MyOnBoardPage({super.key});

  @override
  State<MyOnBoardPage> createState() => _MyOnBoardPageState();
}

class _MyOnBoardPageState extends State<MyOnBoardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: imageBackground,
            child: Image.asset(
              'assets/food-delivery/food pattern.png',
              repeat: ImageRepeat.repeatY,
              color: imageBackground2,
            ),
          ),
          Positioned(
            top: -80,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/food-delivery/chef.png',
            ),
          ),
          Positioned(
            top: 130,
            right: 50,
            child: Image.asset(
              'assets/food-delivery/leaf.png',
              width: 80,
            ),
          ),
          Positioned(
            top: 390,
            right: 40,
            child: Image.asset(
              'assets/food-delivery/chili.png',
              width: 80,
            ),
          ),
          Positioned(
            top: 230,
            left: -20,
            child: Image.asset(
              'assets/food-delivery/ginger.png',
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 75,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'The Fastest In Delivery ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Food',
                            style: TextStyle(color: red),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Our job is to filling yout tummy with delicious food and fast delivery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          3,
                          (index) => Container(
                            width: index == 0 ? 20 : 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: index == 0 ? orange : grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false);
                      },
                      color: red,
                      height: 66,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, -30, 0, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
