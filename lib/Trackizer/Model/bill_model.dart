class Bill {
  final String name;
  final DateTime date;
  final String price;

  Bill({
    required this.name,
    required this.date,
    required this.price,
  });
}

final List<Bill> bills = [
  Bill(
    name: "Spotify",
    date: DateTime(2023, 7, 25),
    price: "5.99",
  ),
  Bill(
    name: "YouTube Premium",
    date: DateTime(2023, 7, 25),
    price: "18.99",
  ),
  Bill(
    name: "Microsoft OneDrive",
    date: DateTime(2023, 7, 25),
    price: "29.99",
  ),
  Bill(
    name: "Netflix",
    date: DateTime(2023, 7, 25),
    price: "15.00",
  ),
];
