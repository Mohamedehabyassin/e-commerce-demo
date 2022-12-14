import 'package:demo_task/shared/components/app_container.dart';
import 'package:demo_task/shared/components/app_text.dart';
import 'package:demo_task/shared/getX/controller/favourite/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
            child: largeAppText("Favourite"),
          ),
          GetBuilder<FavouriteController>(
            builder: (controller) {
              return SizedBox(
                height: 900,
                child: ListView.separated(
                  itemCount: controller.favouriteProducts.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 35),
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
                                      controller.favouriteProducts[index].images![0])),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  largeAppText(
                                      "${controller.favouriteProducts[index].title}"),
                                  const SizedBox(height: 5),
                                  smallAppText(
                                      "${controller.favouriteProducts[index].description}"),
                                  Text(
                                    "\$ ${controller.favouriteProducts[index].price}",
                                    style: TextStyle(
                                        color: HexColor("#B13E55"),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            )),
                      ],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
