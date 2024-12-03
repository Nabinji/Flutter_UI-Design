import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/f_category_model.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Models/f_model.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Utils/colors.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Views/f_items_details.dart';
import 'package:flutter_ui_design/Fashion%20E-Commerce%20App/Widgets/banner.dart';
import 'package:iconsax/iconsax.dart';

class FashionAppHomeScreen extends StatefulWidget {
  const FashionAppHomeScreen({super.key});

  @override
  State<FashionAppHomeScreen> createState() => _FashionAppHomeScreenState();
}

class _FashionAppHomeScreenState extends State<FashionAppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // for header parts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/fashion/logo.png",
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Iconsax.shopping_bag,
                        size: 28,
                      ),
                      Positioned(
                        right: -3,
                        top: -5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // for banner
            const FashionBanner(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
            // For category
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  fcategory.length,
                  (index) => Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: fbackgroundColor1,
                          backgroundImage: AssetImage(
                            fcategory[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fcategory[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated For You",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(fashionEcommerceApp.length, (index) {
                  final eCommerceItems = fashionEcommerceApp[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FItemsDetails(),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image:
                                  const DecorationImage(image: AssetImage("")),
                              color: fbackgroundColor2,
                            ),
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.black26,
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                "H&M",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black26,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 17,
                              ),
                              Text(eCommerceItems.rating.toString()),
                              Text(
                                "(${eCommerceItems.review})",
                                style: const TextStyle(color: Colors.black26),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              eCommerceItems.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${eCommerceItems.price.toString()}.00",
                                style: const TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "\$${eCommerceItems.price.toString()}.00",
                                style: const TextStyle(
                                  color: Colors.black26,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.black38,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
