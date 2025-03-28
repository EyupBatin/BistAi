import 'package:admin_menu_example/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';

class LoginUserPassword extends StatelessWidget {
  final TextEditingController passwordController;

  LoginUserPassword({super.key, required this.passwordController});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: finTFColor,
          boxShadow: const [
            BoxShadow(
              color: finGrey,
              offset: Offset(0, 0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          obscureText: true,  // Şifre alanı için gizleme
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
