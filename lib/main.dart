import 'package:demo_task/root/app_root.dart';
import 'package:flutter/material.dart';
import 'core/helper/dio/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const AppRoot());
}
