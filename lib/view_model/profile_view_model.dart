import 'dart:ffi';

import 'package:e_commerceapp/helper/local_storage_data.dart';
import 'package:e_commerceapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  UserModel get userModel => _userModel;
  UserModel _userModel;
  
  

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) async {
      _userModel = value;
    });
    
    _loading.value = false;
    update();
  }

  Future<Void> signOut() async {
    await FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
