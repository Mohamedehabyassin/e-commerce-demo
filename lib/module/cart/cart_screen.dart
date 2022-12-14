import 'package:demo_task/shared/components/app_container.dart';
import 'package:demo_task/shared/components/app_text.dart';
import 'package:demo_task/shared/getX/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              streetContainer("Oxford Street"),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor("#5A7081"), width: 1),
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: largeAppText("Cart"),
          ),
          GetBuilder<CartController>(builder: (controller){
            return SizedBox(
              height: 900,
              //width: double.infinity,
              child: ListView.separated(
                itemCount: controller.cartProducts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 35),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    controller.cartProducts[index].images![0])),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                largeAppText("${controller.cartProducts[index].title}"),
                                const SizedBox(height: 5),
                                smallAppText("${controller.cartProducts[index].category}"),
                                Text("\$ ${controller.cartProducts[index].price}",style: TextStyle(
                                    color: HexColor("#B13E55"),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22
                                ),)
                              ],
                            ),
                          )
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: HexColor("#B0EAFD")),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.decrement(controller.cartProducts[index]);
                                      },
                                      child: Icon(Icons.minimize_sharp,
                                          color: HexColor("#47B6DA")),
                                    ))),
                            largeAppText("${controller.cartProducts[index].quantity}"),
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: HexColor("#B0EAFD")),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.increment(controller.cartProducts[index]);
                                      },
                                      child: Icon(Icons.add,
                                          color: HexColor("#47B6DA")),
                                    ))),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
