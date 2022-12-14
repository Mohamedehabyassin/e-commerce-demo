import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../layout/main_layout/main_layout.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: HexColor("#D93E11")),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor("#F4F9FA"),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: HexColor("#D93E11"),
            unselectedItemColor: HexColor("#949494"),
          )),
      home: MainLayout(),
    );
  }
}
