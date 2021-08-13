import 'package:e_commerceapp/helper/extenstion.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String name, image, description, price, size, productId;
  Color color;
  ProductModel(
      {this.name,
      this.description,
      this.color,
      this.image,
      this.price,
      this.productId,
      this.size});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    image = map['image'];
    price = map['price'];
    size = map['size'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'color': color,
      'image': image,
      'price': price,
      'size': size,
      'productId': productId,
    };
  }
}
