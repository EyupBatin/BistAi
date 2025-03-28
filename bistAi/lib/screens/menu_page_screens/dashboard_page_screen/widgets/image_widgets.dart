import 'package:admin_menu_example/controllers/stock_controller.dart';
import 'package:admin_menu_example/screens/stock_interface_screen/stock_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final StockController _stockController = Get.put(StockController());

final List<Widget> imageWidgets = [
  GestureDetector(
    onTap: () {
      _stockController.setStockName("KCHOL");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/koc-holding.jpg',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("THYAO");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/turkish-airlines-logo.png',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("ASELS");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/aselsan-logo.png',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("GARAN");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/garanti-logo.png',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("KOZAA");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/koza-madencilik-logo.png',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("PETKM");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/petkm-logo.jpeg',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("SAHOL");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/sabanci-holding-logo.png',
      fit: BoxFit.cover,
    ),
  ),
  GestureDetector(
    onTap: () {

      _stockController.setStockName("SISE");
      Get.to(StockInterface());
    },
    child: Image.asset(
      'assets/sise-logo.png',
      fit: BoxFit.cover,
    ),
  ),
];
