import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Grocery-App-UI/Model/products.dart';
import 'package:flutter_ui_design/Grocery-App-UI/Utils/constants.dart';
import 'package:flutter_ui_design/Grocery-App-UI/Views/product_detail_screen.dart';
import 'package:flutter_ui_design/Grocery-App-UI/Widgets/product_items_display.dart';

class HomeScreenGrocery extends StatefulWidget {
  const HomeScreenGrocery({super.key});

  @override
  State<HomeScreenGrocery> createState() => _HomeScreenGroceryState();
}

class _HomeScreenGroceryState extends State<HomeScreenGrocery> {
  String categoryes = 'ALL';
  List<Grocery> grocery = groceryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerParts(),
          //for search bar and filetr
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 65,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            grocery = groceryItems
                                .where(
                                  (element) =>
                                      element.name.toLowerCase().contains(
                                            value.toLowerCase(),
                                          ),
                                )
                                .toList();
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 30,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Grocery",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[50],
                  ),
                  child: const Icon(
                    Icons.tune_rounded,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          // for category
          const SizedBox(height: 20),
          categoryItems(),
          // display the category items
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: List.generate(
                  grocery.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            product: grocery[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductImetsDisplay(
                        grocery: grocery[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Text(
              "Recent Shop",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                groceryItems
                    .where((items) => items.isRecent)
                    .length, // filete isrecent == true

                (index) {
                  Grocery recent = groceryItems
                      .where((items) => items.isRecent)
                      .toList()[index];
                  // get only the items whose isRecent value is true
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(recent.image),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  recent.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  recent.category,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "\$${recent.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -2,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  Padding categoryItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          groceryCategories.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                categoryes = groceryCategories[index];
                categoryes == "ALL"
                    ? grocery = groceryItems
                    : grocery = groceryItems
                        .where((element) =>
                            element.category.toLowerCase() ==
                            categoryes.toLowerCase())
                        .toList();
              });
            },
            child: SizedBox(
              height: 50,
              child: Column(
                children: [
                  Text(
                    groceryCategories[index],
                    style: TextStyle(
                      fontSize:
                          categoryes == groceryCategories[index] ? 18 : 16,
                      color: categoryes == groceryCategories[index]
                          ? textGreen
                          : Colors.black26,
                      fontWeight: categoryes == groceryCategories[index]
                          ? FontWeight.w900
                          : FontWeight.w500,
                    ),
                  ),
                  categoryes == groceryCategories[index]
                      ? const CircleAvatar(
                          radius: 4,
                          backgroundColor: textGreen,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Welcome\n",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: "Nafiu Ibrahim",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
              image: const DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
