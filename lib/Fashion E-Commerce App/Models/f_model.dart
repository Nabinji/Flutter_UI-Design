import 'package:flutter/material.dart';

class FappModel {
  final String name, image,description;
  final double rating;
  final int review, price;
  List<Color> fcolor;
  List<String> size;

  FappModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.fcolor,
    required this.size,
    required this.description,
  });
}

List<FappModel> fashionEcommerceApp = [
  FappModel(
    name: "Oversized Fit Printed Mesh T-Shirt",
    rating: 4.9,
    image: "",
    price: 295,
    review: 136,
    fcolor: [Colors.black, Colors.blue, Colors.blue[100]!],
    size: [
      "XS",
      "S",
      "M",
    ],
    description: "Elevate your casual wardrobe with our Loose Fit Printed T-shirt. Crafted from premium cotton for maximum comfort, this relaxed-fit tee features."
  ),
  FappModel(
    name: "Printed Sweatshirt",
    rating: 4.8,
    image: "",
    price: 314,
    review: 178,
    fcolor: [
      Colors.green,
      Colors.black,
      Colors.blue[100]!,
    ],
    size: [
      "X",
      "S",
      "XL",
    ],
    description: "",
  )
];
