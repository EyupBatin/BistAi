import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserPhone extends StatelessWidget {
  UserController userController = Get.find();
  AddUserPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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
          controller: userController.userPhone,
          decoration: InputDecoration(
            hintText: 'Phone',
            border: InputBorder.none,
          ),
        ),

      ),
    );
  }
}
