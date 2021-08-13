import 'package:e_commerceapp/helper/binding.dart';
import 'package:e_commerceapp/view_model/cart_product_view.dart';
import 'package:e_commerceapp/widget/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartProductView());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
