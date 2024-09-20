import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ui_design/Coffee%20Maker/Views/detail_page_coffee.dart';
import 'package:flutter_ui_design/Coffee%20Maker/Widgets/products_items.dart';
import 'package:flutter_ui_design/Coffee%20Maker/consts.dart';

import '../Models/product_model.dart';

class CoffeeHomeScreen extends StatefulWidget {
  const CoffeeHomeScreen({super.key});

  @override
  State<CoffeeHomeScreen> createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  String currentIndex = "All";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      appBar: appBarParts(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.4,
            color: backgroundColor,
          ),
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Find your best\n",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "coffee maker",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "style",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 40),
                child: CarouselSlider.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPageCoffee(
                                 productModel: products[index]),
                            ),
                          );
                        },
                        child: ProductsItems(
                          productModel: products[index],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.75,
                    padEnds: false,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    height: size.height * 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Trendy Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = categories[index];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                                border: currentIndex == categories[index]
                                    ? Border.all(
                                        color: Colors.black26,
                                        width: 1.5,
                                      )
                                    : const Border(),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: size.width * 0.46,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: products.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: size.width * 0.46,
                          height: 200,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(
                                products[index].image,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBarParts() {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: [
        const SizedBox(width: 25),
        Image.network(
          "https://static.thenounproject.com/png/1614628-200.png",
          height: 35,
          width: 35,
          color: Colors.white,
        ),
        const Spacer(),
        Image.network(
          "https://www.freepnglogos.com/uploads/search-png/search-tubshroom-the-revolutionary-hair-catcher-snare-and-31.png",
          height: 20,
          width: 20,
          color: Colors.white,
        ),
        const Stack(
          children: [
            Icon(
              Icons.notifications_outlined,
              size: 30,
              color: Colors.white,
            ),
            Positioned(
              right: 5,
              top: 3,
              child: Icon(
                Icons.circle,
                color: Colors.red,
                size: 10,
              ),
            ),
          ],
        ),
        const SizedBox(width: 25)
      ],
    );
  }
}
