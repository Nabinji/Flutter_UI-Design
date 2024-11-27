import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/colors.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/models/coffee_model.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/pages/coffee_detai_screen.dart';

class CoffeeAppHomeScreen extends StatefulWidget {
  const CoffeeAppHomeScreen({super.key});

  @override
  State<CoffeeAppHomeScreen> createState() => _CoffeeAppHomeScreenState();
}

class _CoffeeAppHomeScreenState extends State<CoffeeAppHomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            Container(
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 17, 17, 17),
                    Color.fromARGB(255, 49, 49, 49),
                  ],
                ),
              ),
            ),
            headerParts(),
          ],
        ),
        const SizedBox(height: 35),
        categorySelection(),
        const SizedBox(height: 20),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 270,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listOfCoffee.length,
          itemBuilder: (context, index) {
            final coffee = listOfCoffee[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  CoffeeDetaiScreen(coffee: coffee,),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                            tag: coffee.image,
                            child: Image.asset(
                              coffee.image,
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/coffee-shop/ic_star_filled.png",
                                  height: 12,
                                  width: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${coffee.rate}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      coffee.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      coffee.type,
                      style: TextStyle(
                        color: xsecondaryColor,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${coffee.price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: xprimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Padding headerParts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: xsecondaryColor,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Kathmandu, Nepal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: xsecondaryColor,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff2a2a2a),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/coffee-shop/ic_search.png",
                        color: Colors.white,
                        height: 35,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Search coffee",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: xsecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Container(
                height: 60,
                width: 55,
                decoration: BoxDecoration(
                  color: xprimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.tune,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/coffee-shop/banner.png",
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: coffeeCategories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 25 : 10,
                right: index == coffeeCategories.length - 1 ? 25 : 10,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? xprimaryColor
                    : xsecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Text(
                coffeeCategories[index],
                style: TextStyle(
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 16,
                    color:
                        selectedIndex == index ? Colors.white : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
