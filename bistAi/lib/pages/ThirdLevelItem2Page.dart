import 'package:flutter/material.dart';
import 'package:admin_menu_example/main.dart';

import '../main.dart';
import 'MyScaffold.dart';

class ThirdLevelItem2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/thirdLevelItem2',
      body: Center(
        child: Text('Third Level Item 2 Page'),
      ),
    );
  }
}
