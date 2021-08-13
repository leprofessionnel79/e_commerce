import 'package:e_commerceapp/view/auth/signup_screen.dart';
import 'package:e_commerceapp/view_model/auth_view_model.dart';
import 'package:e_commerceapp/widget/custom_btn.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:e_commerceapp/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  
  final GlobalKey<FormState> _globalKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome',
                    fontSize: 30,

                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(SignUpScreen());
                    },
                    child: CustomText(
                      text: 'Sign Up',
                      color: primarycolor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Sign in to continue',
                color: Colors.grey,
                fontSize: 14,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'jannblomondo@gmail.com',
                onSave: (value){
                  controller.email=value;
                },
                validator: (value){
                  if(value==null)
                    {
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
                onSave: (value){
                  controller.password=value;
                },
                validator: (value){
                  if(value==null)
                  {
                    print("Error");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Forget Password ?!',
                fontSize: 14,
                alignment: Alignment.bottomRight,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text:"Sign In",
                  onPressed:()
                  {
                    if(_globalKey.currentState.validate())
                      {
                        _globalKey.currentState.save();
                        controller.SignInWithEmailAndPassword();

                      }
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}
