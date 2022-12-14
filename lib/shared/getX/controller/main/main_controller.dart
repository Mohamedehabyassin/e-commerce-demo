import 'package:demo_task/module/cart/cart_screen.dart';
import 'package:demo_task/module/favourite/favourite_screen.dart';
import 'package:demo_task/module/home/home_screen.dart';
import 'package:demo_task/module/news/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  int navigationCurrentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItemList = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_sharp), label: 'Grocery'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_alert_outlined), label: 'News'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Favourite'),
    BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Cart')
  ];

  List<Widget> mainScreensList = [
    HomeScreen(),
    const NewsScreen(),
    FavouriteScreen(),
    CartScreen()
  ];

  void changeSelectedValue(int selectedValue) {
    navigationCurrentIndex = selectedValue;
    update();
  }
}
