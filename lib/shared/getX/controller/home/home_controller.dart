import 'package:demo_task/core/helper/dio/dio_helper.dart';
import 'package:demo_task/model/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeController extends GetxController {
  List<Product> homeProductList = [];
  List<String> categoriesName = [];
  List<Color> categoriesColor = [
    HexColor("#F9BDAD"),
    HexColor("#FAD96D"),
    HexColor("#CCB8FF"),
    HexColor("#B0EAFD"),
    HexColor("#FF9DC2"),
    HexColor("#FAD96D"),
    HexColor("#F9BDAD"),
    HexColor("#FAD96D"),
    HexColor("#CCB8FF"),
    HexColor("#B0EAFD"),
    HexColor("#FF9DC2"),
    HexColor("#FAD96D"),
    HexColor("#F9BDAD"),
    HexColor("#FAD96D"),
    HexColor("#CCB8FF"),
    HexColor("#B0EAFD"),
    HexColor("#FF9DC2"),
    HexColor("#FAD96D"),
    HexColor("#F9BDAD"),
    HexColor("#FAD96D"),
    HexColor("#CCB8FF"),
    HexColor("#B0EAFD"),
    HexColor("#FF9DC2"),
    HexColor("#FAD96D"),
  ];

  // Home Controller Methods

  @override
  Future<void> onInit() async {
    getAllProducts();
    getAllProductCategories();
    super.onInit();
  }

  void getAllProducts() async {
    if(homeProductList.isEmpty){
      DioHelper.getData(url: "products").then((value) {
        final ProductModel productModel = ProductModel.fromJson(value.data);
        for (var element in productModel.products!) {
          homeProductList.add(element);
        }
        // homeProductList = productModel.products!;
        update();
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }
    update();


  }

  void getAllProductCategories() async {
    DioHelper.getData(url: "products/categories").then((value) {
      debugPrint(value.data.toString());
      for (var element in value.data) {
        categoriesName.add(element);
      }
      // homeProductList = productModel.products!;
      update();
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
