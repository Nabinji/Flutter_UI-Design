class Plant {
  final String name, image, height, temparature, pot;
  final String? category;
  final double price;
  Plant(
    {
    required   this.height,
   required this.temparature,
   required this.pot,
    required this.name,
    required this.image,
    required this.price,
    this.category,
  });
}

List<Plant> plants = [
  Plant(
    name: "Snake Plants",
    price: 12.99,
    image: "assets/plant-shop/snake-plants.png",
    height: "20cm - 35cm",
    temparature: "11°C to 22°C",
    pot: "Soil Pot"
  ),
  Plant(
    name: "Lucky Jade Plant",
    price: 12.99,
    image: "assets/plant-shop/lucky-jade-plants.png",
     height: "30cm - 40cm",
      temparature: "20°C to 25°C",
      pot: "Ciramic Pot"
  ),
  Plant(
    name: "Small Plants",
    category: "Super greens",
    price: 12.99,
    image: "assets/plant-shop/Small-Plant.png",
     height: "30cm -  40cm",
      temparature: "20°C to 25°C",
      pot: "Soil Pot"
  ),
  Plant(
    name: "Peperomia Plant",
    category: "Super greens",
    price: 12.99,
    image: "assets/plant-shop/Peperomia_Plant.png",
     height: "50cm -  60cm",
      temparature: "30°C to 40°C",
      pot: "Ciramic Pot"

  ),
  Plant(
    name: "Mini Plant",
    price: 12.99,
    image: "assets/plant-shop/Mini_Plant.png",
     height: "20cm -  30cm",
      temparature: "20°C to 25°C",
      pot: "Wood Pot"
  ),
];
