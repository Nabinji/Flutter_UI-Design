import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/models/product_model.dart';
import '../consts.dart';
import '../models/categories_model.dart';
import '../widgets/product_item.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String category = 'Burger';
  List<FoodModel> myFoodModel = foodProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          const SizedBox(width: 25),
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: grey1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/food-delivery/icon/dash.png'),
          ),
          const Spacer(),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: red,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                'California, US',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: orange,
                size: 18,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: grey1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/food-delivery/profile.png'),
          ),
          const SizedBox(width: 25),
        ],
      ),
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
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: imageBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
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
                                    text: 'The Fastest In Delivery ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Food',
                                    style: TextStyle(color: red),
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
                                vertical: 9,
                                horizontal: 15,
                              ),
                              child: const Text(
                                'Order Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/food-delivery/courier.png',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SingleChildScrollView(
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
                                .where(
                                  (element) =>
                                      element.category.toLowerCase() ==
                                      myCategories[index].name.toLowerCase(),
                                )
                                .toList();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 18),
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
                              shape: BoxShape.circle,
                            ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'View All',
                      style: TextStyle(
                        color: orange,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.all(3),
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
                ),
              ],
            ),
          ),
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
                        pageBuilder: (_, __, ___) => DetailPage(
                          product: myFoodModel[index],
                        ),
                      ),
                    ),
                    child: ProductItem(product: myFoodModel[index]),
                  ),
                ),
              ),
            ),
          ),
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
                SizedBox(height: 5),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: red,
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
            Stack(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: grey,
                  size: 30,
                ),
                Positioned(
                  top: -4,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
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
}
