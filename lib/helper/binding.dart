import 'package:e_commerceapp/helper/local_storage_data.dart';
import 'package:e_commerceapp/model/cart_product_model.dart';
import 'package:e_commerceapp/view_model/auth_view_model.dart';
import 'package:e_commerceapp/view_model/checkout_view_model.dart';
import 'package:e_commerceapp/view_model/control_view_model.dart';
import 'package:e_commerceapp/view_model/home_view_model.dart';
import 'package:e_commerceapp/widget/control_view.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => ControlView());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartProductModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
  }
}
