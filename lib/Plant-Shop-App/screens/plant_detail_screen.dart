import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Plant-Shop-App/constants.dart';
import 'package:flutter_ui_design/Plant-Shop-App/models/plant_model.dart';

class PlantDetailScreen extends StatefulWidget {
  final Plant plant;
  const PlantDetailScreen({super.key, required this.plant});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
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
                      currentIndex = value;
                    }),
                    itemBuilder: (context, index) => Hero(
                      tag:widget.plant.image,
                      child: Image.asset(
                        widget.plant.image,
                      ),
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
                        height: index == currentIndex ? 20 : 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: index == currentIndex
                              ? primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                "Plansts make your we with minimal and nappy love the plants more and enjoy life.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                  letterSpacing: -.5,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 270,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
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
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      "\$${widget.plant.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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

  Column plantsInfo(icon, name, value) => Column(
        children: [
          Icon(
            icon,
            size: 45,
            color: Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
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
