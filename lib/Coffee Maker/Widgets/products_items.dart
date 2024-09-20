import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Coffee%20Maker/consts.dart';

import '../Models/product_model.dart';
// this error is appear due to the name confilict betwween the folder

class ProductsItems extends StatelessWidget {
  final ProductModel productModel;
  const ProductsItems({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(3, 3),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Hero(
                tag:  productModel.image,
                child: Image.asset(productModel.image)),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            productModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            productModel.subName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 12,
                      color: buttonColor,
                    ),
                  ),
                  Text(
                    productModel.price.toStringAsFixed(2),
                    style: const TextStyle(
                      color: buttonColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
