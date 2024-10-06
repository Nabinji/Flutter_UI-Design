import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food-Recipe-App/recipe_home.dart';
import 'package:flutter_ui_design/Grocery-App-UI/Utils/constants.dart';

class RecipeOnBoardingScreen extends StatefulWidget {
  const RecipeOnBoardingScreen({super.key});

  @override
  State<RecipeOnBoardingScreen> createState() => _RecipeOnBoardingScreenState();
}

class _RecipeOnBoardingScreenState extends State<RecipeOnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: size.height * 0.625,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade400,
                  Colors.grey.shade200,
                  Colors.white
                ],
              ),
              image: const DecorationImage(
                image: AssetImage('assets/food-recipe/background 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: size.height * 0.325,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Let's cook your own food\nand adjust your diet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.3,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Don't be confused, Complete your nutritional\nneeds by choosing food here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecipeHomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: gradientColor
                      ),
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
// 90