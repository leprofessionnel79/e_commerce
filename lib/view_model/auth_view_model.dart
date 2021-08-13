import 'package:e_commerceapp/core/services.dart';
import 'package:e_commerceapp/helper/local_storage_data.dart';
import 'package:e_commerceapp/model/user_model.dart';
import 'package:e_commerceapp/view/auth/home_screen.dart';
import 'package:e_commerceapp/widget/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();
  String get user => _user.value?.email;
  String email, password, name;
  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurentUserData(_auth.currentUser.uid);
    }
  }

  @override
  void onReady() {
    
    super.onReady();
  }

  @override
  void onClose() {
    
    super.onClose();
  }

  void SignInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurentUserData(value.user.uid);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        'Error email login',
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent,
      );
    }
  }

  void SignUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(HomeScreen());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error SignUp', e.message,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.transparent);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user.uid,
        email: user.user.email,
        name: name == null ? user.user.displayName : name,
        pic: '');

    await FireStoreUser().addUserToFireStore(userModel);

    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUserData(userModel);
  }

  void getCurentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }
}
