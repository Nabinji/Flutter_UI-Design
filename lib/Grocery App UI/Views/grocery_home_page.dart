import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Grocery%20App%20UI/Model/category_model.dart';
import 'package:flutter_ui_design/Grocery%20App%20UI/see_all_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/product_item.dart';
import '../contants.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                      children: const [
                        TextSpan(text: 'Hello, '),
                        TextSpan(
                          text: 'Ella\n',
                          style: TextStyle(
                            color: Constants.PRIMARY_COLOR,
                          ),
                        ),
                        TextSpan(
                          text: 'What do you need',
                          style: TextStyle(
                            fontSize: 17,
                            color: Constants.GREY_COLOR,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Constants.PRIMARY_COLOR,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.green[50],
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for items here',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16,
                          color: Constants.GREY_COLOR,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Constants.GREY_COLOR,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        groceryCategory.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: selectedIndex == index ? 2 : 1,
                                  color: selectedIndex == index
                                      ? Colors.green
                                      : Colors.black45,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green[50],
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          groceryCategory[index].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    groceryCategory[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: selectedIndex == index
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllProducts(),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 16,
                            color: Constants.GREY_COLOR,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Constants.GREY_COLOR,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buildTopProducts(context),
          ],
        ),
      ),
    );
  }

  Widget buildTopProducts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 280,
          child: ListView(
            primary: false,
            scrollDirection: Axis.horizontal,
            children: const [
              ProductItem(
                image: "assets/grocery-ui/banana.png",
                title: "Fresh Banana",
                price: "\$2.30/Kilo",
              ),
              ProductItem(
                image: "assets/grocery-ui/milk.png",
                title: "Plain Milk",
                price: "\$4.10/Bottle",
              ),
              ProductItem(
                image: "assets/grocery-ui/egg_4.png",
                title: "White Egg",
                price: "\$6.00/12",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
