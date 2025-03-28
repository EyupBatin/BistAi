import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/stock_controller.dart';
class DropDownButtonYears extends StatefulWidget {
  final List<dynamic> years; // dynamic türünde alıyoruz

  DropDownButtonYears({super.key, required this.years});

  @override
  State<DropDownButtonYears> createState() => _DropDownButtonYearsState();
}

class _DropDownButtonYearsState extends State<DropDownButtonYears> {
  final StockController _stockController = Get.put(StockController());

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>( // dynamic parametre tipi
      value: _stockController.getSelectedYear(),
      hint: const Text("Select Year"),
      items: widget.years
          .map((year) => DropdownMenuItem(
        value: year,
        child: Text(year.toString()), // dynamic türünü yazdırıyoruz
      ))
          .toList(),
      onChanged: (value) {
        _stockController.setSelectedYears(value);
      },
    );
  }
}
