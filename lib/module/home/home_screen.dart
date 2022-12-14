import 'package:demo_task/shared/components/app_container.dart';
import 'package:demo_task/shared/components/app_text.dart';
import 'package:demo_task/shared/getX/controller/cart/cart_controller.dart';
import 'package:demo_task/shared/getX/controller/favourite/favourite_controller.dart';
import 'package:demo_task/shared/getX/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CartController cartController =
      Get.put(CartController(), permanent: true);

  final FavouriteController favouriteController =
      Get.put(FavouriteController(), permanent: true);

  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              streetContainer("Mustafa St."),
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: HexColor("#F5F7F9"),
                border: Border.all(color: HexColor("#E0E0E0"), width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 12),
                smallAppText("Search in thousands of products"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(child: largeAppText("Home Address")),
                            FittedBox(child: smallAppText("Mustafa St. No:2"))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                const SizedBox(width: 8),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300]),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(child: largeAppText("Home Address")),
                            FittedBox(child: smallAppText("Mustafa St. No:2"))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              largeAppText("Explore by Category"),
              smallAppText("See All (36)")
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
              width: double.infinity,
              height: 90,
              child: GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) => ListView.separated(
                  itemCount: controller.categoriesName.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: controller.categoriesColor[index],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        const SizedBox(height: 2),
                        smallAppText(controller.categoriesName[index])
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                ),
              )),
          const SizedBox(height: 35),
          largeAppText("Deals of the day"),
          const SizedBox(height: 18),
          SizedBox(
              width: double.infinity,
              height: 130,
              child: GetBuilder<HomeController>(
                builder: (controller) => controller.homeProductList.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.homeProductList.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(controller
                                            .homeProductList[index]
                                            .images![0])),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: GetBuilder<FavouriteController>(
                                          init: FavouriteController(),
                                          builder: (favouriteController) {
                                            return GestureDetector(
                                              onTap: () {
                                                favouriteController.addToCart(
                                                    controller.homeProductList[
                                                        index]);
                                              },
                                              child: favouriteController
                                                      .isExist(controller
                                                              .homeProductList[
                                                          index])
                                                  ? const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 15,
                                                    )
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.grey,
                                                      size: 15,
                                                    ),
                                            );
                                          },
                                        )),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    largeAppText(
                                        "${controller.homeProductList[index].title}"),
                                    const SizedBox(height: 5),
                                    smallAppText(
                                        "${controller.homeProductList[index].description}"),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${controller.homeProductList[index].price}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: HexColor("#E36F53")),
                                        ),
                                        const SizedBox(width: 18),
                                        Text(
                                          "\$ ${controller.homeProductList[index].price! + 38}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          cartController.addToCart(controller
                                              .homeProductList[index]);
                                        },
                                        child: const Text("Add to Cart"))
                                  ],
                                ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )),
          const SizedBox(height: 25),
          Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                  color: HexColor("#FEC2CA"),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 2.6,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mega",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: HexColor("#EE6A61"), fontSize: 14),
                        ),
                        FittedBox(
                          child: Text(
                            "WHOPPER",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: HexColor("#33185C"),
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ 17",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: HexColor("#EE6A61"),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(width: 40),
                            const Text(
                              "\$ 32",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        const FittedBox(
                          child: Text(
                            "* Available until 24 December 2020",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
