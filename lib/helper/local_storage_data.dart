import 'dart:convert';

import 'package:e_commerceapp/constant.dart';
import 'package:e_commerceapp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel userModel = await _getUserData();

      if (userModel == null) {
        return null;
      }

      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = await prefs.get(CASHED_USER_DATA);

    return UserModel.fromJson(jsonDecode(value));
  }

  setUserData(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(CASHED_USER_DATA, json.encode(userModel.toJson()));
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
