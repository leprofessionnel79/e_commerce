
import 'package:e_commerceapp/core/home_services.dart';
import 'package:e_commerceapp/model/category_model.dart';
import 'package:e_commerceapp/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;


  List<ProductModel> _productsModel = [];
  List<ProductModel> get productsModel => _productsModel;


  HomeViewModel() {
    getCategory();
    getBestSelling();
  }

  getCategory() async {
    _loading.value = true;
    await HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJeson(value[i].data()));
       
        _loading.value = false;
      }
      update();
    });
  }

  getBestSelling() async {
    _loading.value = true;

    await HomeServices().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productsModel.add(ProductModel.fromJson(value[i].data()));
        print(_productsModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
