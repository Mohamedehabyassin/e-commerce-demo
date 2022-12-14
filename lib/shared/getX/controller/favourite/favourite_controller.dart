import 'package:demo_task/model/product/product_model.dart';
import 'package:demo_task/shared/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<Product> favouriteProducts = [];

  bool isExist(Product item) {
    return favouriteProducts
            .where((element) => element.id == item.id)
            .isNotEmpty
        ? true
        : false;
  }

  void addToCart(Product product) {
    if (isExist(product)) {
      toast(text: "Item removed from favourite", color: Colors.green);
      removeFromCart(product);
    } else {
      toast(text: "Item Added from favourite", color: Colors.green);
      favouriteProducts.add(product);
    }
    update();
  }

  void removeFromCart(Product productData) {
    var current =
        favouriteProducts.firstWhere((element) => element.id == productData.id);
    favouriteProducts.remove(current);
    update();
  }
}
