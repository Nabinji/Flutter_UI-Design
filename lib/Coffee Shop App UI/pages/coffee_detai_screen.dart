import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/Widgets/common_button.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/colors.dart';
import 'package:flutter_ui_design/Coffee%20Shop%20App%20UI/models/coffee_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetaiScreen extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetaiScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetaiScreen> createState() => _CoffeeDetaiScreenState();
}

class _CoffeeDetaiScreenState extends State<CoffeeDetaiScreen> {
  String selectedIndex = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(height: 65),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              const Text(
                "Detail",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Iconsax.heart),
            ],
          ),
          const SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Hero(
              tag: widget.coffee.image ,
              child: Image.asset(
                widget.coffee.image,
                width: double.infinity,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.coffee.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.type,
                        style: TextStyle(
                          fontSize: 12,
                          color: xsecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset(
                            "assets/coffee-shop/ic_star_filled.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.coffee.rate}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            " (${widget.coffee.review})",
                            style: TextStyle(
                              fontSize: 12,
                              color: xsecondaryColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      "assets/coffee-shop/bike.png",
                      "assets/coffee-shop/bean.png",
                      "assets/coffee-shop/milk.png",
                    ].map((e) {
                      return Container(
                        margin: const EdgeInsets.only(left: 12),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          e,
                          height: 25,
                          width: 25,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black12,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ReadMoreText(
                widget.coffee.description,
                trimLength: 125,
                trimMode: TrimMode.Length,
                trimCollapsedText: " Read More",
                trimExpandedText: " Read Less",
                style: TextStyle(
                  fontSize: 15,
                  color: xsecondaryColor,
                ),
                moreStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xprimaryColor,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xprimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: ['S', '', 'M', '', 'L'].map((e) {
                  if (e == "") return const SizedBox(width: 20);
                  bool isSelected = selectedIndex == e;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = e;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? xprimaryColor.withOpacity(0.1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? xprimaryColor : Colors.black12,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected ? xprimaryColor : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Price",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: xsecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${widget.coffee.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: xprimaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 240,
              child: CommonButton(
                title: "Buy Now",
                onTab: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
