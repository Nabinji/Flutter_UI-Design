import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Plant-Shop-App/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_design/Plant-Shop-App/models/plant_model.dart';
import 'package:flutter_ui_design/Plant-Shop-App/screens/plant_detail_screen.dart';

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
      appBar: headerParts(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchField(),
            MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                const Text(
                  "Found \n10 Results",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    height: 1.1,
                  ),
                ),
                for (var plant in plants)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PlantDetailScreen(plant: plant),
                        ),
                      );
                    },
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
                            child: Hero(
                              tag: plant.image,
                              child: Image.asset(plant.image),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            plant.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
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
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -1,
                                ),
                              ),
                              const Spacer(),
                              const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar headerParts() {
    return AppBar(
      backgroundColor: myBackgroundColor,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
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
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Image.asset("assets/plant-shop/profile.png"),
        ),
      ],
    );
  }

  Padding searchField() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Plant",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                    letterSpacing: -.5,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  prefixIcon: const Icon(Icons.search)),
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
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}
