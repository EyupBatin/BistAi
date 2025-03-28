import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../constants/color.dart';
import '../../../controllers/stock_controller.dart';

class StockRankingCard extends StatefulWidget {
  const StockRankingCard({super.key});

  @override
  _StockRankingCardState createState() => _StockRankingCardState();
}

class _StockRankingCardState extends State<StockRankingCard> {
  final StockController _stockController = Get.put(StockController());
  bool isLoading = true;
  List<dynamic> rankings = [];
  bool isRowDark = true;

  @override
  void initState() {
    super.initState();
    fetchRankingData();
  }

  Future<void> fetchRankingData() async {
    try {
      final response = await http.get(
        Uri.parse("http://127.0.0.1:5000/api/get_tahmini_siralama"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // Sort the list based on the "siralama" field in ascending order
        data.sort((a, b) => a['siralama'].compareTo(b['siralama']));
        setState(() {
          rankings = data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load ranking data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: finIMColor,
      appBar: AppBar(
        title: Text(
          'Hisse Tahmin Sıralaması',
          style: TextStyle(color: finTFColor),
        ),
        backgroundColor: finDarkIMColor,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: rankings.length,
          itemBuilder: (context, index) {
            var item = rankings[index];
            // Determine the boolean value for row color

            return Card(
              color: isRowDark ? finDarkIMColor : finBGColor,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildRankingRow('Sıralama', item['siralama'].toString(), true),
                  Divider(color: Colors.grey), // Divider between rows
                  _buildRankingRow('Hisse İsmi', item['company_bist_code'], false), // False means finBGColor
                  Divider(color: Colors.grey), // Divider between rows
                  _buildRankingRow('Puan', item['puan'].toString(), true),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRankingRow(String title, String value, bool whichColor) {
    isRowDark=whichColor;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: finTFColor,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: finTFColor,
            ),
          ),
        ],
      ),
    );
  }
}
