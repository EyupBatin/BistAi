import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class CustomEditAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomEditAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: finIMColor,
      elevation: 0,
      title: Text("Kullanıcıyı Düzenle"),
    );

  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
