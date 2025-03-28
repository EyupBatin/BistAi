import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/screens/menu_page_screens/dashboard_page_screen/widgets/build_carousel_slider.dart';
import 'package:admin_menu_example/screens/menu_page_screens/dashboard_page_screen/widgets/build_stream_container.dart';
import 'package:admin_menu_example/screens/menu_page_screens/dashboard_page_screen/widgets/image_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../pages/MyScaffold.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Stream<String> euroPriceStream;
  late Stream<String> usdPriceStream;
  late Stream<String> goldPriceStream;
  late Stream<String> bist100PriceStream;

  @override
  void initState() {
    super.initState();
    euroPriceStream = fetchStockPriceStream('EURTRY=X');
    usdPriceStream = fetchStockPriceStream('USDTRY=X');
    goldPriceStream = fetchStockPriceStream('GC=F');
    bist100PriceStream = fetchStockPriceStream('XU100');
  }

  Stream<String> fetchStockPriceStream(String ticker) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 10));
      yield await fetchStockPrice(ticker);
    }
  }

  Future<String> fetchStockPrice(String ticker) async {
    final url = Uri.parse("http://192.168.1.104:5000/api/get_stock_price/$ticker");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return '${data['price']} ₺';
    } else {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/',
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            BuildCarouselSlider(),
            const SizedBox(height: 20),
            BuildStreamContainer(label: 'EURTRY', stream: euroPriceStream),
            const SizedBox(height: 10),
            BuildStreamContainer(label: 'USDTRY', stream: usdPriceStream),
            const SizedBox(height: 10),
            BuildStreamContainer(label: 'GOLD', stream: goldPriceStream),
            const SizedBox(height: 10),
            BuildStreamContainer(label: 'BIST100', stream: bist100PriceStream),
          ],
        ),
      ),
    );
  }






}
