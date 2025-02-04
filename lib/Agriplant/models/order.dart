
import 'package:flutter_ui_design/Agriplant/models/product.dart';

class Order {
  final String id;
  final List<AgroProduct> agroProducts;
  final DateTime date;
  Order({
    required this.id,
    required this.agroProducts,
    required this.date,
  });
}
List<Order> orders = [
  Order(
    id: "202304a5",
    agroProducts: agroProducts.reversed.take(3).toList(),
    date: DateTime.utc(2023),
  ),
  Order(
    id: "202204jm",
    agroProducts: agroProducts.take(1).toList(),
    date: DateTime.utc(2022),
  ),
  Order(
    id: "201904vc",
    agroProducts: agroProducts.reversed.skip(2).toList(),
    date: DateTime.utc(2019),
  ),
];
