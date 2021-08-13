import 'package:e_commerceapp/helper/database/cart_database_helper.dart';
import 'package:e_commerceapp/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductView extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> get cartproductmodel => _cartproductmodel;
  List<CartProductModel> _cartproductmodel = [];

  double get totalprice => _totalprice;
  double _totalprice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartProductView() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;

    _cartproductmodel = await dbHelper.getAllProduct();

    _loading.value = false;

    totalPrice();

    update();
  }

  totalPrice() {
    for (int i = 0; i < _cartproductmodel.length; i++) {
      _totalprice += (double.parse(_cartproductmodel[i].price) *
          _cartproductmodel[i].quantity);

      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartproductmodel.length; i++) {
      if (_cartproductmodel[i].productId == cartProductModel.productId) {
        Get.snackbar(
          'Product Added ',
          'Please Check Your Cart !!',
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent,
        );
        return;
      }
    }

    await dbHelper.insert(cartProductModel);
    _cartproductmodel.add(cartProductModel);
    _totalprice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    Get.snackbar('Product Added ', 'Please Check Your Cart !!',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent);
    update();
  }

  increaseQuantity(int index) async {
    _cartproductmodel[index].quantity++;
    _totalprice += (double.parse(_cartproductmodel[index].price));
    await dbHelper.updateProduct(_cartproductmodel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartproductmodel[index].quantity >= 1) {
      _cartproductmodel[index].quantity--;

      _totalprice -= (double.parse(_cartproductmodel[index].price));
      await dbHelper.updateProduct(_cartproductmodel[index]);
    }
    update();
  }
}
