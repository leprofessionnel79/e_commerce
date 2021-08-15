
import 'package:e_commerceapp/view_model/profile_view_model.dart';
import 'package:e_commerceapp/widget/control_view.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder<ProfileViewModel>(
        init: Get.find(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: (controller.userModel.pic == "" || controller.userModel.pic == null)
                                      ? AssetImage(
                                          "assets/images/image.jpg",
                                        )
                                      // : controller.userModel.pic == "default"
                                      //     ? AssetImage(
                                      //         "assets/images/image.jpg")
                                          : NetworkImage(
                                              controller.userModel.pic)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                        ),
                        // FlatButton(
                        //     onPressed: () {
                        //       print(controller.userModel.name);
                        //     },
                        //     child: Text("signout")),
                        Column(
                          children: [
                            CustomText(
                              text: controller.userModel.name,
                              color: Colors.black,
                              fontSize: 23,
                            ),
                            CustomText(
                              text: controller.userModel.email,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    
                    Container(
                        child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: CustomText(
                          text: 'Edit Profile',
                        ),
                        leading: Icon(Icons.edit),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: TextButton(
                          
                      onPressed: () {},
                      child: ListTile(
                        title: CustomText(
                          text: 'Shipping Address',
                        ),
                        leading: Icon(Icons.location_pin),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: CustomText(
                          text: 'Order History',
                        ),
                        leading: Icon(Icons.history),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: CustomText(
                          text: 'Cards',
                        ),
                        leading: Icon(Icons.card_giftcard),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: FlatButton(
                      onPressed: () {},
                      child: ListTile(
                        title: CustomText(
                          text: 'Notifications',
                        ),
                        leading: Icon(Icons.notifications),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: FlatButton(
                      onPressed: () {
                        controller.signOut();
                        Get.offAll(ControlView());
                      },
                      child: ListTile(
                        title: CustomText(
                          text: 'Log Out',
                        ),
                        leading: Icon(Icons.logout),
                        trailing: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
