import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/models/product_model.dart';
import '../consts.dart';

class ProductItem extends StatelessWidget {
  final FoodModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 200,
          width: size.width / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.03),
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]),
        ),
        Container(
          width: size.width / 2,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: product.imageCard,
                child: Image.asset(
                  product.imageCard,
                  width: 150,
                  height: 110,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  product.name,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                product.specialItems,
                style: TextStyle(
                  height: 0.1,
                  letterSpacing: 1.1,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    const TextSpan(
                      text: '\$',
                      style: TextStyle(color: red, fontSize: 14),
                    ),
                    TextSpan(
                      text: '${product.price}',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
                const SizedBox(height: 15),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 5,
          child: Container(
            width: 22,
            height: 22,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[50],
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/food-delivery/icon/fire.png'),
          ),
        )
      ],
    );
  }
}
