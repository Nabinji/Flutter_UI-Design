import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/plant_model.dart';

class PlantDetailsScreen extends StatefulWidget {
  final Plant plant;
  const PlantDetailsScreen({super.key, required this.plant});

  @override
  State<PlantDetailsScreen> createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  int currentPhoto = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    onPageChanged: (value) => setState(() {
                      currentPhoto = value;
                    }),
                    itemBuilder: (context, index) => Image.asset(
                      widget.plant.image,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 100,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 5),
                        width: 7,
                        height: index == currentPhoto ? 20 : 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: index == currentPhoto
                              ? primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.plant.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Plants make your life with minimal and happy love the plants more and enjoy life.",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: -.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 270,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: primaryColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                plantsInfo(
                  Icons.height,
                  "Height",
                  widget.plant.height,
                ),
                plantsInfo(
                  Icons.device_thermostat,
                  "Temparature",
                  widget.plant.temparature,
                ),
                plantsInfo(
                  Icons.yard_outlined,
                  "Pot",
                  widget.plant.pot,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "\$${widget.plant.price}",
                      style: const TextStyle(
                        height: 1,
                        fontSize: 20,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    color: cartButtonColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column plantsInfo(icon, name, value) {
    return Column(
      children: [
        Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,letterSpacing: -1,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade200,
          ),
        )
      ],
    );
  }
}
