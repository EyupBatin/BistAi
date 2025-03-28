import 'dart:convert';
import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/screens/stock_interface_screen/widgets/interface_app_bar.dart';
import 'package:admin_menu_example/screens/stock_predict_screen/stock_predict_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controllers/stock_controller.dart';

class StockInterface extends StatefulWidget {
  const StockInterface({super.key});

  @override
  _StockInterfaceState createState() => _StockInterfaceState();
}

final StockController _stockController = Get.find<StockController>();

class _StockInterfaceState extends State<StockInterface> {
  List<dynamic> data = [];
  bool isLoading = true;

  String? selectedYear;
  String? selectedMonth;

  List<dynamic> years = [];
  List<String> months = ["3", "6", "9", "12"];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:5000/api/get_table_data/' +
            _stockController.getStockName().toLowerCase()),
      );
      if (response.statusCode == 200) {
        final String jsonString = utf8.decode(response.bodyBytes);
        final List<dynamic> jsonResponse = json.decode(jsonString);

        setState(() {
          data = jsonResponse;
          extractYears();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error: $e');
    }
  }

  void extractYears() {
    if (data.isNotEmpty) {
      final keys = data.first.keys;
      try {
        final filteredKeys = keys.where((key) {
          if (key is String) {
            return key.contains("/");
          } else {
            return false;
          }
        }).toList();
        final stringFilteredKeys = filteredKeys.cast<String>();

        final mappedKeys =
        stringFilteredKeys.map((key) => key.split("/")[0]).toList();

        years = mappedKeys.toSet().toList();
        years.sort();
      } catch (e) {
        debugPrint('Error during processing keys: $e');
      }
    } else {
      debugPrint('Data is empty or does not contain expected keys');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InterfaceAppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
        color: finIMColor,
        child: Column(
          children: [
            Row(
              children: [
                DropdownButton<dynamic>(
                  value: selectedYear,
                  hint: const Text("Select Year"),
                  items: years
                      .map((year) => DropdownMenuItem(
                    value: year,
                    child: Text(year),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value;
                    });
                  },
                ),
                SizedBox(width: 5),
                DropdownButton<String>(
                  value: selectedMonth,
                  hint: const Text("Select Month"),
                  items: months
                      .map((month) => DropdownMenuItem(
                    value: month,
                    child: Text("$month"),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  final bilancoName = item["Bilanço"] ?? "Bilinmiyor";

                  String? value;
                  if (selectedYear != null && selectedMonth != null) {
                    value =
                        item["$selectedYear/$selectedMonth"]?.toString();
                  }

                  return Card(
                    color: finDarkIMColor,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        "$bilancoName ${value ?? 'Veri Yok'}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: finTFColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // FAB Ekleme
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // FAB'e tıklama işlevi
          Get.to(StockPredictScreen());
        },
        backgroundColor: finIMColor,
        child: Container(
          width: 56,  // Specify the width and height to make the photo circular
          height: 56,
          decoration: BoxDecoration(

            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/finai_logo2.png'),
            radius: 50.0,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
