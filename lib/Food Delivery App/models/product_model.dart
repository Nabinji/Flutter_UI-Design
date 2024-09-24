class FoodModel {
  String imageCard, imageDetail, name, description;
  double price, rate;
  String specialItems;
   String category;
  FoodModel({
    required this.imageCard,
    required this.imageDetail,
    required this.name,
    required this.price,
    required this.rate,
    required this.description,
    required this.specialItems,
    required this.category,
  });
}
List<FoodModel> foodProduct = [
  FoodModel(
    imageCard: 'assets/food-delivery/product/beef_burger.png',
    imageDetail: 'assets/food-delivery/product/beef_burger1.png',
    name: 'Beef Burger',
    price: 7.59,
    rate: 4.5,
    specialItems: 'Cheesy Mozarella 🧀',
    description: desc,
    category: 'Burger'
  ),
  FoodModel(
    imageCard: 'assets/food-delivery/product/double_burger.png',
    imageDetail: 'assets/food-delivery/product/double_burger1.png',
    name: 'Double Burger',
    price: 10.0,
    rate: 4.9,
    specialItems: 'Double Beef 🍖',
    description: desc,
    category: 'Burger'
  ),
  FoodModel(
    imageCard: 'assets/food-delivery/product/cheese-burger.png',
    imageDetail: 'assets/food-delivery/product/cheese-burger1.png',
    name: 'Cheese Burger',
    price: 8.88,
    rate: 4.8,
    specialItems: 'Extra Cheese 🧀',
    description: desc,
    category: 'Burger',
  ),
  FoodModel(
    imageCard: 'assets/food-delivery/product/bacon_burger.png',
    imageDetail: 'assets/food-delivery/product/bacon_burger1.png',
    name: 'Bacon Burger',
    price: 9.99,
    rate: 5.0,
    specialItems: 'Mix Beef 🥩',
    description: desc,
    category: 'Burger'
  ),
  FoodModel(
    imageCard: 'assets/food-delivery/product/pizza111.png',
    imageDetail: 'assets/food-delivery/product/pizza.png',
    name: 'Chicken Pizza',
    price: 19.99,
    rate: 4.0,
    specialItems: 'Cheese Pizza 🍕',
    description: desc,
    category: 'Pizza'
  ),
   FoodModel(
    imageCard: 'assets/food-delivery/product/cup_cake.png',
    imageDetail: 'assets/food-delivery/product/cup-cake1.png',
    name: 'Cream Cake',
    price: 5.99,
    rate: 4.7,
    specialItems: 'Mix Cream 🧁',
    description: desc,
    category: 'Cup Cake',
  ),
];
var desc =
    "This is a special types of tiems, often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a 'specialItems sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns.";
