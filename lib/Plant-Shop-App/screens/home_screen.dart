import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import '../constants.dart';
import '../models/plant_model.dart';
import 'plant_details_screen.dart';

class PlantsHomeScreen extends StatefulWidget {
  const PlantsHomeScreen({super.key});

  @override
  State<PlantsHomeScreen> createState() => _PlantsHomeScreenState();
}

class _PlantsHomeScreenState extends State<PlantsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
          "Search Products",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset("assets/plant-shop/profile.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Plant",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          letterSpacing: -.5,
                          fontWeight: FontWeight.bold,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        prefixIcon: const Icon(CupertinoIcons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: const Icon(Iconsax.setting_4),
                    ),
                  ),
                ],
              ),
            ),
            MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                const Text(
                  "Found \n10 Results",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    fontSize: 32,
                  ),
                ),
                for (var plant in plants)
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantDetailsScreen(
                          plant: plant,
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(plant.image),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            plant.name,
                            style: const TextStyle(
                              fontSize: 15,
                              letterSpacing: -1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          plant.category != null
                              ? Text(
                                  plant.category!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                )
                              : const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "\$${plant.price}",
                                style: const TextStyle(
                                  fontSize: 16,letterSpacing: -1,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: const Icon(
                                  Iconsax.heart5,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
