class CartProductModel {
  String name, image, price, productId;
  int quantity;
  CartProductModel(
      {this.name, this.quantity, this.image, this.price, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    quantity = map['quantity'];
    image = map['image'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price,
      'productId': productId,
    };
  }
}
