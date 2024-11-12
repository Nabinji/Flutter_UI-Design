import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/product_model.dart';

class CartModel {
  final MyProductModel productModel;
  int quantity;

  CartModel({
    required this.productModel,
    required this.quantity,
  });
}
