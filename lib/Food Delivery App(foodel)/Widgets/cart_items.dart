import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/cart_model.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Provider/cart_provider.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/consts.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final CartModel cart;
  const CartItems({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 140,
      width: size.width / 1.2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 130,
            width: size.width - 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            top: -5,
            left: 0,
            child: Transform.rotate(
              angle: 10 * pi / 180,
              child: SizedBox(
                height: 130,
                width: 130,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kblack.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      cart.productModel.image,
                      width: 130,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            right: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.productModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 20,
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
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          cart.productModel.rate.toString(),
                          style: TextStyle(
                            color: kblack.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: kpink,
                          size: 20,
                        ),
                        Text(
                          "${cart.productModel.distance}m",
                          style: TextStyle(
                            color: kblack.withOpacity(0.8),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${(cart.productModel.price).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: kblack,
                        fontSize: 25,
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cart.quantity > 1) {
                              cartProvider.recuceQuantity(cart.productModel);
                            }
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          cart.quantity.toString(),
                          style: const TextStyle(
                            color: kblack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            cartProvider.addCart(cart.productModel);
                          },
                          child: Container(
                            width: 25,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
