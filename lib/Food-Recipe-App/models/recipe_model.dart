List<String> menuItems = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Snack',
  'Cheat Menu',
];

class RecipeItems {
  final String image, name, woner, wonerName, reviews;
  final int carb;
  final double rate;
  final int calorie, fat, protein, weight;
  final bool fav;

  RecipeItems({
    required this.image,
    required this.wonerName,
    required this.woner,
    required this.name,
    required this.fav,
    required this.reviews,
    required this.rate,
    required this.calorie,
    required this.fat,
    required this.weight,
    required this.protein,
    required this.carb,
  });
}

List<RecipeItems> recipeItems = [
   RecipeItems(
    woner:
        "https://www.befunky.com/images/wp/wp-2021-01-linkedin-profile-picture-after.jpg?auto=avif,webp&format=jpg&width=944",
    wonerName: "Natasha Evelyn",
    image: 'assets/food-recipe/sald-mix.png',
    name: 'Salad Mix',
    rate: 4,
    calorie: 320,
    reviews: "24",
    weight: 300,
    fat: 16,
    protein: 12,
    fav: true,
    carb: 30,
  ),
   RecipeItems(
    woner:
        "https://plus.unsplash.com/premium_photo-1676660359316-273bb172a0df?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fHww",
    wonerName: "Natasha Evelyn",
    image: 'assets/food-recipe/Shrimp Kale.png',
    name: 'Shrimp Kale',
    rate: 4,
    calorie: 2200,
    reviews: "33",
    weight: 200,
    fat: 30,
    protein: 15,
    fav: false,
    carb: 15,
  ),

  RecipeItems(
    woner:
        "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.1819120589.1728086400&semt=ais_hybrid",
    wonerName: "",
    image: 'assets/food-recipe/ckicken-salad.png',
    name: 'Chicken Salad',
    rate: 4.3,
    weight: 250,
    calorie: 240,
    reviews: "100",
    fav: false,
    fat: 30,
    protein: 15,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/food-recipe/mushroom salad.png',
    name: 'Mushroom salad',
    rate: 5.0,
    wonerName: "Mr/Ms Mushroom",
    woner:
        "https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
    fav: true,
    weight: 200,
    calorie: 320,
    reviews: "Prakash Subedi",
    fat: 30,
    protein: 15,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/food-recipe/grilled-chicken-salad.jpg',
    name: 'Grilled Chicken Salad',
    rate: 4.5,
    fav: true,
    woner:
        "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewpersonaltraining-697509.jpg&fm=jpg",
    weight: 400,
    calorie: 420,
    wonerName: "Ramesh Shahi",
    reviews: "50",
    fat: 50,
    protein: 30,
    carb: 15,
  ),
  RecipeItems(
    image: 'assets/food-recipe/thai salad.png',
    name: 'Thai Salad',
    rate: 4.9,
    fav: false,
    reviews: '52',
    wonerName: "Hari Prasad",
    weight: 200,
    calorie: 120,
    woner:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvJaoIeJQU_V9rL_ZII61whWyqSFbmMgTgwQ&s",
    fat: 50,
    protein:16,
    carb: 30,
  ),
];
