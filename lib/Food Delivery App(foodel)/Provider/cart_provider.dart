import 'package:flutter/material.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/cart_model.dart';
import 'package:flutter_ui_design/Food%20Delivery%20App(foodel)/Model/product_model.dart';

class CartProvider with ChangeNotifier {
  // private list _carts to store cart items, each represented by a cartModel
  List<CartModel> _carts = [];
  // getter for _Carts to access the list fo cart items.
  List<CartModel> get carts => _carts;
  // setter for _Carts. updates the cart llist and notifies listeners when it changes.
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners(); // Notifies any widgets listening to this provider to rebuild.
  }

  // adds a product to the cart.
  addCart(MyProductModel productModel) {
    if (productExist(productModel)) {
      // finds the index of the product in the cart.
      int index =
          _carts.indexWhere((element) => element.productModel == productModel);
      // increents the quantity of the product by 1 if it lready exists.
      _carts[index].quantity = _carts[index].quantity + 1;
    } else {
      // add a new CartModel item with quantity  1 if the product doesnt exist in the cart.
      _carts.add(CartModel(productModel: productModel, quantity: 1));
    }
    notifyListeners(); // update
  }

  // increase the quantity of a specific product in the cart by 1,
  addQuantity(MyProductModel product) {
    // finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.productModel == product);
    // increaments the quantity by 1.
    _carts[index].quantity = _carts[index].quantity + 1;
    notifyListeners(); // update the quantity change.
  }

  // decreases the quantity of a specific product in the cart by 1.
  recuceQuantity(MyProductModel product) {
    // finds the index of the product in the cart.
    int index = _carts.indexWhere((element) => element.productModel == product);
    // decrements the quantity by 1.
    _carts[index].quantity = _carts[index].quantity - 1;
    notifyListeners(); // update the quantity change.
  }

// checks if a product already exists in the cart.
// returen ture if the product is in the cart, false otherwise.
  productExist(MyProductModel productModel) {
    if (_carts.indexWhere((element) => element.productModel == productModel) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  // calculates the total price of all items in the cart.
  double totalCart() {
    double total = 0; //initialize the total to 0,
    for (var i = 0; i < _carts.length; i++) {
      // adds the price for each cart item
      total = total + _carts[i].quantity * _carts[i].productModel.price;
    }
    return total; // returns the total price of all cart items.
  }
}
