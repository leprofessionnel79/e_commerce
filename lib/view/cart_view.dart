import 'package:e_commerceapp/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:e_commerceapp/constant.dart';

import 'package:e_commerceapp/view_model/cart_product_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'checkout/checkout_view.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartProductView>(
      init: Get.find(),
      builder: (controler) => controler.cartproductmodel.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/ecard.svg",
                  width: 170,
                  height: 170,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  alignment: Alignment.bottomCenter,
                  text: 'Cart is Empty',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )
              ],
            )
          : Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: controler.cartproductmodel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 140,
                            child: Row(
                              children: [
                                Container(
                                  width: 140,
                                  child: Image.network(
                                    controler.cartproductmodel[index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controler
                                            .cartproductmodel[index].name,
                                        fontSize: 27,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text:
                                            "\$${controler.cartproductmodel[index].price.toString()}",
                                        fontSize: 18,
                                        color: primarycolor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controler
                                                    .increaseQuantity(index);
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            CustomText(
                                              alignment: Alignment.center,
                                              text: controler
                                                  .cartproductmodel[index]
                                                  .quantity
                                                  .toString(),
                                              fontSize: 25,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 19),
                                              child: GestureDetector(
                                                onTap: () {
                                                  controler
                                                      .decreaseQuantity(index);
                                                },
                                                child: Icon(
                                                  Icons.minimize,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "TOTAL",
                              fontSize: 25,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder<CartProductView>(
                              init: Get.find(),
                              builder: (controller) => CustomText(
                                text: "\$ ${controller.totalprice}",
                                fontSize: 23,
                                color: primarycolor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 100,
                          width: 170,
                          child: CustomButton(
                            onPressed: () {
                              Get.to(CheckOutView());
                            },
                            text: "CHECK OUT",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
