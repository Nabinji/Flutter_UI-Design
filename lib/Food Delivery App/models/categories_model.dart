class Category {
  String image, name;

  Category({required this.image, required this.name});
}

List<Category> myCategories = [
  Category(
    image: 'assets/food-delivery/burger.png',
    name: 'Burger',
  ),
  Category(
    image: 'assets/food-delivery/pizza.png',
    name: 'Pizza',
  ),
  Category(
    image: 'assets/food-delivery/cup cake.png',
    name: 'Cup Cake',
  ),
];
