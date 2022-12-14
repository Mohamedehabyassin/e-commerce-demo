import 'package:flutter/material.dart';

Widget largeAppText(String text) => Text(text,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700));

Widget smallAppText(String text) => Text(text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: const TextStyle(fontSize: 12));
