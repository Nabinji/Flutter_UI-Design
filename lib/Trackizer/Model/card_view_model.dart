class VirtualCardModel {
  final String name;
  final String number;
  final String monthYear;

  VirtualCardModel({
    required this.name,
    required this.number,
    required this.monthYear,
  });
}

final List<VirtualCardModel> virtualCards = [
  VirtualCardModel(
    name: "Code for Any1",
    number: "**** **** **** 2197",
    monthYear: "08/27",
  ),
  VirtualCardModel(
    name: "Code for Any2",
    number: "**** **** **** 2198",
    monthYear: "09/27",
  ),
  VirtualCardModel(
    name: "Code for Any3",
    number: "**** **** **** 2297",
    monthYear: "07/27",
  ),
  VirtualCardModel(
    name: "Code for Any4",
    number: "**** **** **** 2397",
    monthYear: "05/27",
  ),
];

// class SubscriptionModel {
//   final String name;
//   final String icon;
//   final String price;

//   SubscriptionModel({
//     required this.name,
//     required this.icon,
//     required this.price,
//   });
// }


// final List<SubscriptionModel> subscriptions = [
//   SubscriptionModel(
//     name: "Spotify",
//     icon: "assets/img/spotify_logo.png",
//     price: "5.99",
//   ),
//   SubscriptionModel(
//       name: "YouTube Premium",
//       icon: "assets/img/youtube_logo.png",
//       price: "18.99"),
//   SubscriptionModel(
//       name: "Microsoft OneDrive",
//       icon: "assets/img/onedrive_logo.png",
//       price: "29.99"),
//   SubscriptionModel(
//     name: "NetFlix",
//     icon: "assets/img/netflix_logo.png",
//     price: "15.00",
//   ),
// ];
