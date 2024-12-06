class FCategory {
  final String name, image;
  FCategory({required this.name, required this.image});
}

List<FCategory> fcategory = [
  FCategory(
    name: "Women",
    image: "assets/fashion/women.png",
  ),
  FCategory(
    name: "Men",
    image: "assets/fashion/men.png",
  ),
  FCategory(
    name: "Teens",
    image: "assets/fashion/teen.png",
  ),
  FCategory(
    name: "Kids",
    image: "assets/fashion/kids.png",
  ),
    FCategory(
    name: "Baby",
    image: "assets/fashion/baby.png",
  ),
];

List<String> filterCategory = [
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];