import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import '../Model/onboard_model.dart';
import 'main_page.dart';


class AppOnBoardPage extends StatefulWidget {
  const AppOnBoardPage({super.key});

  @override
  State<AppOnBoardPage> createState() => _AppOnBoardPageState();
}

class _AppOnBoardPageState extends State<AppOnBoardPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblack,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: onboards.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Positioned(
                    top: -70,
                    left: 0,
                    right: 0,
                    child: FadeInDown(
                      delay: const Duration(milliseconds: 500),
                      child: Image.asset(
                        onboards[index].image,
                        width: 600,
                        height: 600,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height / 1.9,
                    child: FadeInUp(
                       delay: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onboards[index].text1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              onboards[index].text2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            left: 25,
            bottom: 170,
            child: FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Row(
                children: [
                  ...List.generate(
                    onboards.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 5,
                      width: 50,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            child: FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    color: korange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 72,
                    minWidth: MediaQuery.of(context).size.width - 50,
                    child: const Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
