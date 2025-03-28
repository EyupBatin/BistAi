import 'package:admin_menu_example/screens/menu_page_screens/stock_tables_view_screen/stock_tables_view.dart';
import 'package:admin_menu_example/screens/menu_page_screens/bist_ai_predicts_screen/bist_ai_tahminleri.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/menu_page_screens/dashboard_page_screen/dashboardPage.dart';
import '../screens/menu_page_screens/risk_analysis_form_screen/risk_analysis_form.dart';

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Color(0xFF9D9D9D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: themeBlack,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: themeBlack,
        ),
        primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: themeTextPrimary,
        ),
        primaryIconTheme: IconThemeData(
          color: themeTextPrimary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => _buildPageWithFuture(settings),
        );
      },
    );
  }

  Future<Widget> _loadPage(String? route) async {
    // Ensure route is not null and has a valid value
    route ??= '/';  // Fallback to '/' if route is null

    // Simulate a delay for loading the page
    await Future.delayed(Duration(seconds: 1));

    switch (route) {
      case '/':
        return DashboardPage();
      case '/secondLevelItem1':
        return RiskAnalysisForm();
      case '/secondLevelItem2':
        return StockTablesView();
      case '/secondLevelItem3':
        return StockRankingCard();
      default:
        return Scaffold(
          body: Center(child: Text('Page not found')),
        );
    }
  }

  Widget _buildPageWithFuture(RouteSettings settings) {
    return FutureBuilder<Widget>(
      future: _loadPage(settings.name ?? '/'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error loading page')),
          );
        } else {
          return snapshot.data!;
        }
      },
    );
  }
}
