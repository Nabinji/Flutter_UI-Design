class Subscription {
  final String name;
  final String icon;
  final String price;

  Subscription({
    required this.name,
    required this.icon,
    required this.price,
  });
}

final List<Subscription> subscriptions = [
  Subscription(
    name: "Spotify",
    icon: "assets/img/spotify_logo.png",
    price: "5.99",
  ),
  Subscription(
      name: "YouTube Premium",
      icon: "assets/img/youtube_logo.png",
      price: "18.99"),
  Subscription(
      name: "Microsoft OneDrive",
      icon: "assets/img/onedrive_logo.png",
      price: "29.99"),
  Subscription(
    name: "Netflix",
    icon: "assets/img/netflix_logo.png",
    price: "15.00",
  ),
];
