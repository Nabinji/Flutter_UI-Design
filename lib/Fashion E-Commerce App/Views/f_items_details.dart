import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class FItemsDetails extends StatelessWidget {
  const FItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: fbackgroundColor2,
        centerTitle: true,
        title: const Text("Detail Product"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Iconsax.shopping_bag,
                size: 28,
              ),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: size.height*0.42,
            width: size.width,
            color: fbackgroundColor2,
          ),
        ],
      ),
    );
  }
}
