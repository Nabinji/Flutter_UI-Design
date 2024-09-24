import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/Widget/products_items_display.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/consts.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/models/categories_model.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/models/product_model.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/pages/food_detail_screen.dart';

class FoodDeliveryHomeScreen extends StatefulWidget {
  const FoodDeliveryHomeScreen({super.key});

  @override
  State<FoodDeliveryHomeScreen> createState() => _FoodDeliveryHomeScreenState();
}

class _FoodDeliveryHomeScreenState extends State<FoodDeliveryHomeScreen> {
  int selectedIndex = 0;
  String category = "Burger";
  List<FoodModel> myFoodModel = foodProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarParts(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // For banner
                appBanners(),
                const SizedBox(height: 35),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          // for category
          categoryItems(),
          const SizedBox(height: 20),
          viewAll(),
          // for display items
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: List.generate(
                myFoodModel.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: index == myFoodModel.length - 1 ? 25 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => FoodDetailScreen(
                          product: myFoodModel[index],
                        ),
                      ),
                    ),
                    child: ProductsItemsDisplay(
                      foodModel: myFoodModel[index],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 110,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_filled,
                  color: red,
                  size: 30,
                ),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.red,
                )
              ],
            ),
            const Icon(
              Icons.favorite_outline_rounded,
              color: grey,
              size: 30,
            ),
            Container(
              padding: const EdgeInsets.all(17),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: red,
              ),
              child: const Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
            ),
            const Icon(
              Icons.notifications_outlined,
              color: grey,
              size: 30,
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding viewAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Popular Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const Text(
                "View All",
                style: TextStyle(
                  color: orange,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: List.generate(
          myCategories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 25),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  category = myCategories[index].name;
                  category == "Burger"
                      ? myFoodModel = foodProduct
                      : myFoodModel = foodProduct
                          .where((element) =>
                              element.category.toLowerCase() ==
                              myCategories[index].name.toLowerCase())
                          .toList();
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: category == myCategories[index].name ? red : grey1,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: category == myCategories[index].name
                              ? Colors.white
                              : Colors.transparent,
                          shape: BoxShape.circle),
                      child: Image.asset(
                        myCategories[index].image,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      myCategories[index].name,
                      style: TextStyle(
                        color: category == myCategories[index].name
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container appBanners() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: imageBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "The Fastest In Delivery ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Food",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 9,
                  ),
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
          Image.asset("assets/food-delivery/courier.png")
        ],
      ),
    );
  }

  AppBar appBarParts() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: [
        const SizedBox(width: 25),
        Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: grey1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/food-delivery/icon/dash.png"),
        ),
        const Spacer(),
        const Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: red,
            ),
            SizedBox(width: 5),
            Text(
              "Kathmandu, Nepal",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: orange,
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: grey1,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("assets/food-delivery/profile.png"),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
