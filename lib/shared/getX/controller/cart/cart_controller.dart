import 'package:demo_task/model/product/product_model.dart';
import 'package:demo_task/shared/components/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<Product> cartProducts = [];
  double cartTotal = 0;

  bool isExist(Product item) {
    return cartProducts.where((element) => element.id == item.id).isNotEmpty
        ? true
        : false;
  }

  void changeAmount() {
    cartTotal = 0;
    for (var element in cartProducts) {
      cartTotal += element.price! * element.quantity;
    }
  }

  void increment(Product product){
    for(int i=0 ;i < cartProducts.length;i++){
      if(cartProducts[i].id == product.id){
        cartProducts[i].quantity++;
      }
    }
    changeAmount();
    update();
  }

  void decrement(Product product){
    for(int i=0 ;i < cartProducts.length;i++){
      if(cartProducts[i].id == product.id){
        if(cartProducts[i].quantity > 1 ) {
          cartProducts[i].quantity--;
        }
      }
    }
    changeAmount();
    update();
  }

  void addToCart(Product product) {
    if (isExist(product)) {
      toast(text: "Already Exist in Cart", color: Colors.green);
    } else {
      toast(text: "Added to Cart", color: Colors.green);
      cartProducts.add(product);
    }
    changeAmount();
    update();
  }

  void removeFromCart(Product productData) {
    var current =
        cartProducts.firstWhere((element) => element.id == productData.id);
    cartProducts.remove(current);
    changeAmount();
    update();
  }
}
