import 'package:e_commerceapp/view/auth/home_screen.dart';
import 'package:e_commerceapp/view/auth/profile_view.dart';
import 'package:e_commerceapp/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  Widget _currentscreen = HomeScreen();
  get currentsecreen => _currentscreen;

  void ChangeSelectedValue(int selectedvalue) {
    _navigatorValue = selectedvalue;

    switch (selectedvalue) {
      case 0:
        {
          _currentscreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentscreen = CartScreen();
          break;
        }
      case 2:
        {
          _currentscreen = ProfileView();
          break;
        }
    }
    update();
  }
}
