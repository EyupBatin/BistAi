import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../controllers/stock_controller.dart';
import '../../constants/color.dart';
import 'widgets/predict_app_bar.dart';

class StockPredictScreen extends StatefulWidget {
  const StockPredictScreen({super.key});

  @override
  _StockPredictScreenState createState() => _StockPredictScreenState();
}

class _StockPredictScreenState extends State<StockPredictScreen> {
  final StockController _stockController = Get.find<StockController>();
  bool isLoading = true;
  Map<String, dynamic> predictionData = {};

  @override
  void initState() {
    super.initState();
    fetchPredictionData();
  }

  Future<void> fetchPredictionData() async {
    try {
      final stockName = _stockController.getStockName().toUpperCase();
      final response = await http.get(
        Uri.parse('http://127.0.0.1:5000/api/get_tahminler'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final prediction = data.firstWhere(
              (item) => item['company_bist_code'] == stockName,
          orElse: () => {},
        );

        setState(() {
          predictionData = prediction;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load prediction data');
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
      appBar: PredictAppBar(),
      backgroundColor: finIMColor,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : predictionData.isEmpty
          ? const Center(child: Text('No data found for this stock'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPredictionCard(
                'Beklenen Tahmini Net Kar', predictionData["tahmin_net_kar"]),
            _buildPredictionCard(
                'Beklenen Tahmini Özkaynaklar', predictionData["tahmin_ozkaynaklar"]),
            _buildPredictionCard(
                'Tahmin Tarihi', predictionData["tahmin_tarihi"]),
          ],
        ),
      ),
    );
  }

  Widget _buildPredictionCard(String title, String? value) {
    return Card(
      color: finDarkIMColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          "$title: ${value ?? 'Veri Yok'}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: finTFColor,
          ),
        ),
      ),
    );
  }
}
