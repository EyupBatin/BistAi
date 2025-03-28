import 'package:admin_menu_example/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesClass.loginUser,
      getPages: RoutesClass.routes,
    ),
  );
}
