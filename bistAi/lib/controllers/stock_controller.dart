import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StockController extends GetxController {
  late TextEditingController stockController = TextEditingController();
  final _stockName = 'hisse'.obs;
  final _selectedYear = ''.obs;

  String getStockName() {
    return _stockName.value;
  }

  void setStockName(String stockName) {
    _stockName.value = stockName;
  }
  String getSelectedYear(){
    return _selectedYear.value;
  }
  void setSelectedYears(String selectedYear){
    _selectedYear.value=selectedYear;
  }



}
