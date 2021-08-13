import 'package:e_commerceapp/constant.dart';
import 'package:e_commerceapp/model/cart_product_model.dart';
import 'package:e_commerceapp/model/product_model.dart';
import 'package:e_commerceapp/view_model/cart_product_view.dart';
import 'package:e_commerceapp/widget/custom_btn.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailesView extends StatelessWidget {
  ProductModel model;

  DetailesView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: model.size,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomText(
                        text: 'Details',
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: model.description,
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE ",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: ' \$' + model.price,
                        color: primarycolor,
                        fontSize: 18,
                      )
                    ],
                  ),
                  GetBuilder<CartProductView>(
                    init: Get.find(),
                    builder: (controler) => Container(
                      padding: EdgeInsets.all(20),
                      width: 180,
                      height: 100,
                      child: CustomButton(
                        onPressed: () {
                          controler.addProduct(CartProductModel(
                            name: model.name,
                            price: model.price,
                            image: model.image,
                            productId: model.productId,
                            quantity: 1,
                          ));
                        },
                        text: 'Add',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
