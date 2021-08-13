import 'package:e_commerceapp/constant.dart';
import 'package:e_commerceapp/model/product_model.dart';
import 'package:e_commerceapp/view/detailes.dart';
import 'package:e_commerceapp/view_model/home_view_model.dart';
import 'package:e_commerceapp/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
  ];

  ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: ListView(
                children: [
                  _searchTextFormField(),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: 'Categories',
                    fontSize: 16,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _lisViewCategory(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Best Selling',
                        fontSize: 18,
                      ),
                      CustomText(
                        text: 'See All',
                        fontSize: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _listViewProduct()
                ],
              ),
            )),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _lisViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 290,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productsModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailesView(
                  model: controller.productsModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 200,
                        child: Image.network(
                          controller.productsModel[index].image,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productsModel[index].name,
                      color: Colors.black,
                      alignment: Alignment.bottomLeft,
                    ),
                    CustomText(
                      text: controller.productsModel[index].description,
                      color: Colors.grey.shade400,
                      alignment: Alignment.bottomLeft,
                    ),
                    CustomText(
                      text: controller.productsModel[index].price + '\$',
                      alignment: Alignment.bottomLeft,
                      color: primarycolor,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
