import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/controllers/stock_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictAppBar extends StatefulWidget implements PreferredSizeWidget {
  PredictAppBar({super.key});

  @override
  _PredictAppBarState createState() => _PredictAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PredictAppBarState extends State<PredictAppBar> {
  final RxString stockPrice = "".obs;
  final StockController _stockController = Get.find<StockController>();
  late String stockUrl;
  double previousPrice = 0.0;
  final RxString priceChangeStatus = 'none'.obs; // 'up', 'down', 'none'

  @override
  void initState() {
    super.initState();
    stockUrl =
        "http://127.0.0.1:5000/api/get_stock_price/${_stockController.getStockName().toUpperCase()}";
    fetchStockPrice();
    Timer.periodic(Duration(seconds: 1), (timer) {
      fetchStockPrice(); // 1 saniyede bir fiyatı güncelle
    });
  }

  Future<void> fetchStockPrice() async {
    try {
      final response = await http.get(Uri.parse(stockUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double newPrice = double.parse(data['price'].toString());
        stockPrice.value = newPrice.toStringAsFixed(2);

        // Fiyat değişimini kontrol et
        if (newPrice > previousPrice) {
          priceChangeStatus.value = 'up'; // Fiyat arttı
          previousPrice = newPrice;
        } else if (newPrice < previousPrice) {
          priceChangeStatus.value = 'down'; // Fiyat düştü
          previousPrice = newPrice;
        } else {
          priceChangeStatus.value = 'none'; // Fiyat değişmedi
        }
      } else {
        stockPrice.value = "Error"; // Veri çekilemezse hata mesajı
        priceChangeStatus.value = 'none'; // Fiyat değişmedi
      }
    } catch (e) {
      stockPrice.value = "Error"; // Hata durumunda
      priceChangeStatus.value = 'none'; // Fiyat değişmedi
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: finDarkIMColor,
      elevation: 0,
      title: Text(
        _stockController.getStockName(),
        style: TextStyle(
          color: finTFColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            String price = stockPrice.value;
            String priceStatus = priceChangeStatus.value;
            Color priceColor = finTFColor; // Varsayılan renk
            IconData? icon = null; // Varsayılan ok ikonu (fiyat arttığında kullanılacak)

            if (priceStatus == 'up') {
              priceColor = Color(0xFF66FF66); // Fiyat arttı
              icon = Icons.arrow_circle_up; // Yükselme ikonu
            } else if (priceStatus == 'down') {
              priceColor = Color(0xFFFF0000); // Fiyat düştü
              icon = Icons.arrow_circle_down; // Düşüş ikonu
            }

            return Container(
              child: Row(
                children: [
                  // Yön ok ikonu
                  Icon(
                    icon,
                    color: priceColor,
                  ),
                  SizedBox(width: 5),
                  // Fiyat kısmı
                  Text(
                    price != "" ? "$price ₺" : "Loading...",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: finTFColor),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
