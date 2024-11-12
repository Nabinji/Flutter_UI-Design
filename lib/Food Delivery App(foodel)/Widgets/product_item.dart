import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/product_model.dart';
import 'package:provider/provider.dart';
import '../consts.dart';
import '../Provider/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final MyProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
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
            // color: Colors.transparent,
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
                    // color: Colors.transparent,
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
                                    color: kblack.withOpacity(0.3),
                                    spreadRadius: 10,
                                    blurRadius: 30,
                                  )
                                ]),
                          ),
                        ),
                        Image.asset(
                          product.image,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.name,
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
                          product.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          "${product.distance}m",
                          style: TextStyle(
                            color: kblack.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  '\$${(product.price).toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: kblack,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              cartProvider.addCart(product);
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
                size: 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
