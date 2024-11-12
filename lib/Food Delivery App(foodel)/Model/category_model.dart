class CategoryModel {
  final String image, name;

  CategoryModel({required this.image, required this.name});
}

List<CategoryModel> myCategories = [
  CategoryModel(
    image: 'assets/food-delivery(foodel)/ramen.png',
    name: 'Ramen',
  ),
  CategoryModel(
    image: 'assets/food-delivery(foodel)/burger.png',
    name: 'Burger',
  ),
  CategoryModel(
    image: 'assets/food-delivery(foodel)/salad.png',
    name: 'Salad',
  ),
  CategoryModel(
    image: 'assets/food-delivery(foodel)/pancake.png',
    name: 'Waffle',
  ),
];
