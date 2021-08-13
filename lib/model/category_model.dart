class CategoryModel {
  String name, image;

  CategoryModel({this.name, this.image});

  CategoryModel.fromJeson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
  }

  toJeson() {
    return {'name': name, 'image': image};
  }
}
