import 'package:e_commerceapp/view_model/auth_view_model.dart';
import 'package:e_commerceapp/widget/custom_btn.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:e_commerceapp/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';
import 'login_screen.dart';


class SignUpScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (){
            Get.to(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              CustomText(
                text: 'SignUp',
                fontSize: 30,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'SignUp to continue',
                color: Colors.grey,
                fontSize: 14,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'ahmad',
                onSave: (value) {
                   controller.name=value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'jannblomondo@gmail.com',
                onSave: (value) {
                  controller.email=value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '************',
                onSave: (value) {
                  controller.password=value;
                },
                validator: (value) {
                  if (value == null) {
                    print("Error");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),


              CustomButton(
                  text: "SignUp",
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      controller.SignUpWithEmailAndPassword();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
