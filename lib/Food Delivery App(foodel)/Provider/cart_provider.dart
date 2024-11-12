import 'package:flutter/material.dart';

import '../Model/cart_model.dart';
import '../Model/product_model.dart';

class CartProvider with ChangeNotifier {
  /// Private list `_carts` to store cart items, each represented by a `CartModel`.
  List<CartModel> _carts = [];

  /// Getter for `_carts` to access the list of cart items.
  List<CartModel> get carts => _carts;

  /// Setter for `_carts`. Updates the cart list and notifies listeners when it changes.
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners(); // Notifies any widgets listening to this provider to rebuild.
  }

  /// Adds a product to the cart.
  addCart(MyProductModel productModel) {
    if (productExist(productModel)) {
      // Finds the index of the product in the cart.
      int index =
          _carts.indexWhere((element) => element.productModel == productModel);

      // Increments the quantity of the product by 1 if it already exists.
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      // Adds a new `CartModel` item with quantity 1 if the product doesn't exist in the cart.
      _carts.add(CartModel(productModel: productModel, quantity: 1));
    }
    notifyListeners(); // Notifies listeners that the cart has been updated.
  }

  /// Increases the quantity of a specific product in the cart by 1.
  addQuantity(MyProductModel product) {
    // Finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.productModel == product);

    // Increments the quantity by 1.
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners(); // Notifies listeners of the change in quantity.
  }

  /// Decreases the quantity of a specific product in the cart by 1.
  reduceQuantity(MyProductModel product) {
    // Finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.productModel == product);

    // Decrements the quantity by 1.
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners(); // Notifies listeners of the change in quantity.
  }

  /// Checks if a product already exists in the cart.
  /// Returns `true` if the product is in the cart, `false` otherwise.
  productExist(MyProductModel productModel) {
    if (_carts.indexWhere((element) => element.productModel == productModel) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  /// Calculates the total price of all items in the cart.
  double totalCart() {
    double total = 0; // Initialize the total to 0.
    for (var i = 0; i < _carts.length; i++) {
      // Adds the price for each cart item (quantity * price).
      total = total + _carts[i].quantity * _carts[i].productModel.price;
    }
    return total; // Returns the total price of all cart items.
  }
}
