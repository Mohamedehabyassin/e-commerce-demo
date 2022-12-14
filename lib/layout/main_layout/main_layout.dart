import 'package:demo_task/shared/getX/controller/cart/cart_controller.dart';
import 'package:demo_task/shared/getX/controller/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatelessWidget {
  MainLayout({Key? key}) : super(key: key);

  final GlobalKey bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: controller
                      .mainScreensList[controller.navigationCurrentIndex],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return FittedBox(
                          child: Text(
                        "\$ ${controller.cartTotal.toInt()}",
                        overflow: TextOverflow.ellipsis,
                      ));
                    },
                  )),
              bottomNavigationBar: BottomNavigationBar(
                items: controller.bottomNavigationBarItemList,
                currentIndex: controller.navigationCurrentIndex,
                onTap: controller.changeSelectedValue,
              ),
            ));
  }
}
