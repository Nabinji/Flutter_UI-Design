List<String> categories = [
  'All',
  'Grinder',
  'Pour Over',
  'Mokapot',
  'Canvas'
];

class ProductModel {
  final String image, video, rating, name, subName, description;
  final double price;

  ProductModel({
    required this.image,
    required this.name,
    required this.subName,
    required this.description,
    required this.price,
    required this.rating,
    required this.video,
  });
}

List<ProductModel> products = [
  ProductModel(
    image: 'assets/coffee/image1.png',
    name: 'Manual Grinder New',
    subName: 'Full Spectrume CBD Oil',
    description: description,
    price: 139.50,
    rating: "4.9 [3.2k]",
    video: "assets/coffee/video2.mp4",
  ),
  ProductModel(
    image: 'assets/coffee/image2.png',
    name: 'Electric Burr Coffee',
    subName: 'Adjustable Burr Mil',
    description: description,
    price: 124.90,
    rating: "4.0 [2.1k]",
    video: "assets/coffee/video3.mp4",
  ),
  ProductModel(
    image: 'assets/coffee/image3.png',
    name: 'Manual Grinder Moeni',
    subName: 'Vintage Black',
    description: description,
    price: 125.80,
    rating: "4.5 [1.1k]",
    video: "assets/coffee/video4.mp4",
  ),
];
String howToPouringCoffee =
    'Step 1: Heat the water and prepare the coffee grounds\nStep 2: Pre-wet the filter\nStep 3: Get your supplies and scale ready\nStep 4: Pour the water\nStep 5: Let the water draw down as you pour\nStep 6: Enjoy your perfect pour-over coffee';
String description =
    'Durable Stainless Steel 420 Cronical burr coffee grinder, 38mm efficient burr and double bearing support pin make coffee beans grinding more detailed and uniform. You can grind enough coffee for your family in one minute';
