import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/screens/menu_page_screens/stock_tables_view_screen/stock_tables_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../screens/edit_user_screen/edit_user.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Anasayfa',
      route: '/',
      icon: Icons.dashboard,
    ),
    AdminMenuItem(
      title: 'Risk Analizi',
      route: '/secondLevelItem1',
    ),
    AdminMenuItem(
      title: 'Bilançolar',
      route: '/secondLevelItem2',
    ),
    AdminMenuItem(
      title: 'BistAi Tahminleri',
      route: '/secondLevelItem3',
    ),

  ];
  void _userEdit(){
    Get.to(EditUser());
  }
  void _logout() {
    Get.toNamed('/loginUser');
  }
  final List<AdminMenuItem> _adminMenuItems = const [
    AdminMenuItem(
      title: 'User Profile',
      icon: Icons.account_circle,
      route: '/profile',
    ),
    AdminMenuItem(
      title: 'Settings',
      icon: Icons.settings,
      route: '/settings',
    ),
    AdminMenuItem(
      title: 'Logout',
      icon: Icons.logout,
      route: '/logout',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(

      key: _scaffoldKey,
      backgroundColor: finIMColor,
      appBar: AppBar(
        title: const Text(
          'BistAI',
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Poppins",
            color: finTFColor,
          ),
        ),
        backgroundColor: finDarkIMColor,

        actions: [
          Row(
            children: [
              // Search Button
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.to(StockTablesView());
                },
              ),
              // CircleAvatar with PopupMenuButton
              PopupMenuButton<AdminMenuItem>(
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/finai_logo.png'),
                ),
                itemBuilder: (context) {
                  return _adminMenuItems.map((AdminMenuItem item) {
                    return PopupMenuItem<AdminMenuItem>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(item.icon),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
                onSelected: (item) {

                  if (item.route == '/logout') {
                    _logout();
                  }
                  else if(item.route=='/profile'){
                    _userEdit();
                  }
                  else if (item.route != null) {
                    Get.toNamed(item.route!);
                  }
                },
              ),
              const SizedBox(width: 8), // Add some spacing between the items
            ],
          ),
        ],
      ),
      sideBar: SideBar(
        backgroundColor: const Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.black26,
        borderColor: const Color(0xFFE7E7E7),
        iconColor: Colors.black87,
        activeIconColor: Colors.blue,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: widget.route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != widget.route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: widget.body,
      ),
    );
  }
}