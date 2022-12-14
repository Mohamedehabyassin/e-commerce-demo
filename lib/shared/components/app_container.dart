import 'package:demo_task/core/color/app_colors.dart';
import 'package:flutter/material.dart';

Container streetContainer(String text) {
  return Container(
    height: 44,
    padding:
    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40.0),
        bottomRight: Radius.circular(10.0),
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      color: AppColors.streetContainerColor,
    ),
    child: Row(
      children:  [
        const Icon(
          Icons.location_on_sharp,
          size: 25,
          color: Colors.white,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}