import 'package:admin_menu_example/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../controllers/stock_controller.dart';
import '../../stock_interface_screen/stock_interface.dart';

class StockTablesView extends StatefulWidget {
  @override
  State<StockTablesView> createState() => _StockTablesViewState();
}

final StockController _stockController = Get.put(StockController());

class _StockTablesViewState extends State<StockTablesView> {
  late Future<List<String>> _tableNamesFuture;
  List<String> _tableNames = [];
  List<String> _filteredTableNames = [];

  @override
  void initState() {
    super.initState();
    _tableNamesFuture = fetchTableNames();
  }

  Future<List<String>> fetchTableNames() async {
    try {
      final response =
          await http.get(Uri.parse("http://127.0.0.1:5000/get_tables"));
      if (response.statusCode == 200) {
        final data = List<String>.from(json.decode(response.body));
        // Belirli tabloyu filtrele
        _tableNames =
            data.where((table) => table != 'hisse_teknik_durumlar').toList();
        _filteredTableNames =
            _tableNames; // Başlangıçta tüm veriler gösterilir.
        return _tableNames;
      } else {
        throw Exception("Failed to load table names: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching table names: $e");
    }
  }

  void runFilter(String enteredKeyword) {
    setState(() {
      if (enteredKeyword.isEmpty) {
        _filteredTableNames = _tableNames;
      } else {
        _filteredTableNames = _tableNames
            .where((table) =>
                table.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bilançolar",
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
            color: finTFColor,
          ),
        ),
        backgroundColor: finDarkIMColor,
      ),
      body: Container(
        color: finIMColor,
        child: FutureBuilder<List<String>>(
          future: _tableNamesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No tables available"));
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value) => runFilter(value),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 20, minWidth: 25),
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredTableNames.length,
                      itemBuilder: (context, index) {
                        final tableName = _filteredTableNames[index];
                        return Card(
                          margin: EdgeInsets.all(5.0),
                          color: finDarkIMColor,
                          // Kartın etrafında boşluk bırakmak için
                          elevation: 5,
                          // Gölgelendirme efekti
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Yuvarlatılmış köşeler
                          ),
                          child: ListTile(
                            title: Text(
                              tableName,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.italic,
                                color: finTFColor,
                              ),
                            ),
                            onTap: () {
                              _stockController.setStockName(tableName);
                              Get.to(StockInterface());
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
