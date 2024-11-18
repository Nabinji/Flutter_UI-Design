import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Doctor%20Appoinment%20App/const.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/product_model.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Provider/cart_provider.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/consts.dart';
import 'package:provider/provider.dart';

class FoodProductItems extends StatelessWidget {
  final MyProductModel productModel;
  const FoodProductItems({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 225,
          width: size.width / 2.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 285,
          width: size.width / 2.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.rotate(
                  angle: 10 * pi / 180,
                  child: SizedBox(
                    height: 160,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.3),
                                  spreadRadius: 10,
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          productModel.image,
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  productModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: kblack,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: kyellow,
                          size: 22,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          productModel.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(.5),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kpink,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${productModel.distance}m",
                          style: TextStyle(
                            color: kblack.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "\$${(productModel.price).toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: kblack,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              cartProvider.addCart(productModel);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: kblack,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
