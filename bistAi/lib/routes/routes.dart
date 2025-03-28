
import 'package:admin_menu_example/screens/add_user_screen/add_user.dart';
import 'package:admin_menu_example/screens/login_user_screen/login_user.dart';
import 'package:admin_menu_example/screens/stock_interface_screen/stock_interface.dart';
import 'package:get/get.dart';

import '../pages/myApp.dart';

class RoutesClass{
static String addUser = "/addUser";
static String loginUser = "/loginUser";
static String myApp = "/myApp";
static String stockInterface = "/stockInterface";
static String stockPricescren = "/stockPriceScreen";


static String getScreenAddUser()=>addUser;
static String getLoginScreenAddUser()=>loginUser;
static String getMyAppScreen()=>myApp;
static String getStockInterface()=>stockInterface;
static String getStockPriceScreen()=>stockPricescren;


static List<GetPage> routes = [
  GetPage(name: addUser, page: () => AddUser()),
  GetPage(name: loginUser, page: () => LoginUser()),
  GetPage(name: myApp, page: () => MyApp()),
  GetPage(name: stockInterface, page: () => StockInterface()),
];
}