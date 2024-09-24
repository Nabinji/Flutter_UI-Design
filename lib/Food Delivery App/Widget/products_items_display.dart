import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/consts.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App/models/product_model.dart';

class ProductsItemsDisplay extends StatelessWidget {
  final FoodModel foodModel;
  const ProductsItemsDisplay({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 200,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.03),
                spreadRadius: 10,
                blurRadius: 20,
              )
            ],
          ),
        ),
        Container(
          width: size.width * 0.5,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: foodModel.imageCard,
                child: Image.asset(
                  foodModel.imageCard,
                  height: 110,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  foodModel.name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                foodModel.specialItems,
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    const TextSpan(
                      text: "\$",
                      style: TextStyle(
                        fontSize: 14,
                        color: red,
                      ),
                    ),
                     TextSpan(
                      text: "${ foodModel.price}",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
