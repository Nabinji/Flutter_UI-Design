import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class FashionBanner extends StatelessWidget {
  const FashionBanner({super.key});

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.height * 0.22,
      width: size.width,
      color: bannerColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "NEW COLLECTIONS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -2,
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 0,
                          fontSize: 40,
                          letterSpacing: -3),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "%",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "OFF",
                          style: TextStyle(
                              fontSize: 10,
                              letterSpacing: -1.5,
                              fontWeight: FontWeight.bold,
                              height: 0.6),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () {},
                  child: const Text(
                    "SHOP NOW",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/fashion/girls.png",
                height: size.height * 0.18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}