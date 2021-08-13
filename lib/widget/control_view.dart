
import 'package:e_commerceapp/view/auth/login_screen.dart';
import 'package:e_commerceapp/view_model/auth_view_model.dart';
import 'package:e_commerceapp/view_model/control_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: Get.put(ControlViewModel()),
              builder: (controller) => Scaffold(
                body: controller.currentsecreen,
                bottomNavigationBar: _bottomNavigationBar(),
              ),
            );
    });
  }

  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controler) => BottomNavigationBar(
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                activeIcon: Text(
                  'Explore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                label: '',
                icon: Image.asset(
                  'assets/images/Icon_Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                )),
            BottomNavigationBarItem(
                activeIcon: Text(
                  'Cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                label: '',
                icon: Image.asset(
                  'assets/images/Icon_Cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                )),
            BottomNavigationBarItem(
                activeIcon: Text(
                  'Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                label: '',
                icon: Image.asset(
                  'assets/images/Icon_User.png',
                  fit: BoxFit.contain,
                  width: 20,
                ))
          ],
          currentIndex: controler.navigatorValue,
          onTap: (index) {
            controler.ChangeSelectedValue(index);
          }),
    );
  }
}
