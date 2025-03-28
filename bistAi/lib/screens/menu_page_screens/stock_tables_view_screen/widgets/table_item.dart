import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../pages/MyScaffold.dart';

class TableItem extends StatefulWidget {
  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  List<String> tableNames = [];
  String? selectedTable;

  @override
  void initState() {
    super.initState();
    fetchTableNames();
  }

  Future<void> fetchTableNames() async {
    try {
      final response = await http.get(Uri.parse("http://127.0.0.1:5000/get_tables"));
      if (response.statusCode == 200) {
        // Assuming the response is a JSON array of strings
        List<dynamic> data = json.decode(response.body);
        setState(() {
          tableNames = data.cast<String>();
        });
      } else {
        // Handle error
        print("Failed to load table names: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching table names: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/tables',
      body: tableNames.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: tableNames.length,
        itemBuilder: (context, index) {
          final tableName = tableNames[index];
          return ListTile(
            title: Text(tableName),
            onTap: () {
              setState(() {
                selectedTable = tableName;
              });
              print("Selected Table: $tableName");
            },
          );
        },
      ),
    );
  }
}
