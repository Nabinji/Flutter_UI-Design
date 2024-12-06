import 'package:flutter/material.dart';

class FappModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  List<Color> fcolor;
  List<String> size;
  bool isCheck;

  FappModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.fcolor,
    required this.size,
    required this.description,
    required this.isCheck,
    required this.category,
  });
}

List<FappModel> fashionEcommerceApp = [
  // id:1
  FappModel(
    name: "Oversized Fit Printed Mesh T-Shirt",
    rating: 4.9,
    image: "assets/fashion/category_image/image23.png",
    price: 295,
    review: 136,
    isCheck: true,
    category: "Women",
    fcolor: [
      Colors.black,
      Colors.blue,
      Colors.blue[100]!,
    ],
    size: [
      "XS",
      "S",
      "M",
    ],
    description: "",
  ),
  // id:2
  FappModel(
    name: "Printed Sweatshirt",
    rating: 4.8,
    image: "assets/fashion/category_image/image24.png",
    price: 314,
    review: 178,
    category: "Men",
    isCheck: false,
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
  ),
  // id:3
  FappModel(
    name: "Loose Fit Sweatshirt",
    rating: 4.7,
    image: "assets/fashion/category_image/image28.png",
    price: 187,
    review: 59,
    isCheck: false,
    category: "Men",
    fcolor: [
      Colors.blue,
      Colors.red,
      Colors.purple,
    ],
    size: [
      "X",
      "XX",
      "XL",
    ],
    description: "",
  ),
  // id:4
  FappModel(
    name: "Loose Fit Hoodie",
    rating: 5.0,
    image: "assets/fashion/category_image/image7.png",
    price: 400,
    review: 29,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.brown,
      Colors.blueGrey,
      Colors.orange,
    ],
    size: [
      "S",
      "X",
    ],
    description: "",
  ),
  // id:5
  FappModel(
    name: "DrvMove™ Track Jacket",
    rating: 4.1,
    image: "assets/fashion/category_image/image8.png",
    price: 290,
    review: 29,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.black,
      Colors.orange,
      Colors.blueAccent,
    ],
    size: [
      "S",
      "XX",
      "X",
      "XL",
    ],
    description: "",
  ),
  // id:6
  FappModel(
    name: "Regular Fit T-Shert",
    rating: 3.9,
    image: "assets/fashion/category_image/image27.png",
    price: 333,
    review: 29,
    category: "Men",
    isCheck: false,
    fcolor: [
      Colors.brown,
      Colors.blueGrey,
      Colors.orange,
    ],
    size: [
      "S",
      "XX",
    ],
    description: "",
  ),

  // id:7
  FappModel(
    name: "Baby Frock",
    rating: 5.0,
    image: "assets/fashion/category_image/image1.png",
    price: 330,
    review: 29,
    category: "Baby",
    isCheck: true,
    fcolor: [
      Colors.red,
      Colors.purple,
      Colors.pinkAccent,
    ],
    size: [
      "S",
      "B",
    ],
    description: "",
  ),
  // id:8
  FappModel(
    name: "Coat For Man",
    rating: 4.5,
    image: "assets/fashion/category_image/image2.png",
    price: 990,
    review: 120,
    category: "Men",
    isCheck: true,
    fcolor: [
      Colors.black,
      Colors.grey,
      Colors.white10,
    ],
    size: [
      "S",
      "XX",
      "X",
      "XL",
    ],
    description: "",
  ),
  // id:9
  FappModel(
    name: "Baby Dress Set",
    rating: 5.8,
    image: "assets/fashion/category_image/image3.png",
    price: 330,
    review: 290,
    category: "Baby",
    isCheck: true,
    fcolor: [
      Colors.white,
      Colors.blue,
      Colors.white10,
    ],
    size: [
      "S",
      "B",
    ],
    description: "",
  ),
  // id:10
  FappModel(
    name: "Casual Hoodie Dress for Kids",
    rating: 4.7,
    image: "assets/fashion/category_image/image4.png",
    price: 200,
    review: 90,
    category: "Kids",
    isCheck: true,
    fcolor: [
      Colors.pink,
      Colors.blue,
      Colors.purple,
    ],
    size: ["S", "B", "X"],
    description: "",
  ),
  // id:11
  FappModel(
    name: "Hoodie For Teens",
    rating: 4.4,
    image: "assets/fashion/category_image/image6.png",
    price: 200,
    review: 90,
    category: "Teen",
    isCheck: true,
    fcolor: [
      Colors.pink,
      Colors.pinkAccent,
      Colors.orange,
    ],
    size: ["S", "B", "x"],
    description: "",
  ),
  // id:13
  FappModel(
    name: "Summer Jacket",
    rating: 4.9,
    image: "assets/fashion/category_image/image9.png",
    price: 300,
    review: 20,
    category: "Men",
    isCheck: true,
    fcolor: [
      Colors.green,
      Colors.blue,
      Colors.black,
    ],
    size: ["S", "X" "XL"],
    description: "",
  ),
  // id:14
  FappModel(
    name: "Winter Jacket",
    rating: 3.0,
    image: "assets/fashion/category_image/image10.png",
    price: 1300,
    review: 120,
    category: "Teens",
    isCheck: true,
    fcolor: [
      Colors.amber,
      Colors.black,
      Colors.amberAccent,
    ],
    size: ["S", "B" "X"],
    description: "",
  ),
  // id:15
  FappModel(
    name: "Pant and Shirt",
    rating: 4.5,
    image: "assets/fashion/category_image/image11.png",
    price: 220,
    review: 70,
    category: "Baby",
    isCheck: true,
    fcolor: [
      Colors.amber,
      Colors.green,
      Colors.blue,
    ],
    size: ["S", "B"],
    description: "",
  ),
  // id:16
  FappModel(
    name: "Mix Double Set",
    rating: 4.6,
    image: "assets/fashion/category_image/image12.png",
    price: 200,
    review: 70,
    category: "Teens",
    isCheck: false,
    fcolor: [
      Colors.pink,
      Colors.green,
      Colors.blue,
    ],
    size: ["S", "X", "XL"],
    description: "",
  ),
  // id:17
  FappModel(
    name: "Coat For Women",
    rating: 4.4,
    image: "assets/fashion/category_image/image13.png",
    price: 200,
    review: 70,
    category: "Women",
    isCheck: false,
    fcolor: [
      Colors.blueGrey,
      Colors.green,
      Colors.grey,
    ],
    size: ["S", "X", "XL"],
    description: "",
  ),
  // id:19
  FappModel(
    name: "Complete Dress",
    rating: 4.5,
    image: "assets/fashion/category_image/image15.png",
    price: 1000,
    review: 170,
    category: "Teens",
    isCheck: false,
    fcolor: [
      Colors.blueGrey,
      Colors.green,
      Colors.grey,
    ],
    size: ["S", "X", "XL"],
    description: "",
  ),
  // id:20
  FappModel(
    name: "Summer Kurti",
    rating: 4.4,
    image: "assets/fashion/category_image/image16.png",
    price: 220,
    review: 60,
    category: "Women",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.orange,
      Colors.black,
    ],
    size: ["S", "X", "XL"],
    description: "",
  ),
  // id:20
  FappModel(
    name: "Loose Sweater",
    rating: 4.4,
    image: "assets/fashion/category_image/image17.png",
    price: 220,
    review: 60,
    category: "Teens",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.orange,
      Colors.black,
    ],
    size: ["S", "X", "XL"],
    description: "",
  ),
  // id:20
  FappModel(
    name: "T-Shert for Women",
    rating: 4.4,
    image: "assets/fashion/category_image/image22.png",
    price: 220,
    review: 60,
    category: "Women",
    isCheck: false,
    fcolor: [
      Colors.black12,
      Colors.blueAccent,
      Colors.black,
    ],
    size: ["S", "X", "XX"],
    description: "",
  ),
  // id:21
  FappModel(
    name: "Kids T-Shert",
    rating: 4.4,
    image: "assets/fashion/category_image/image26.png",
    price: 100,
    review: 10,
    category: "Kids",
    isCheck: true,
    fcolor: [
      Colors.blueGrey,
      Colors.blueAccent,
      Colors.black,
    ],
    size: ["S", "X", "SX"],
    description: "",
  ),
];
const myDescription1 = "Elevate your casual wardrobe with our";
const myDescription2 =
    " .Crafted from premium cotton for maximum comfort, this relaxed-fit tee features.";
