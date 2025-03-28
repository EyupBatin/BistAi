// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:admin_menu_example/controllers/user_controller.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/add_user_button.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/add_user_name.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/add_user_password.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/add_user_phone.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/add_user_surname.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/custom_add_app_bar.dart';
import 'package:admin_menu_example/screens/add_user_screen/widgets/finai_register_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../login_user_screen/widgets/finai_login_image.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAddAppBar(),
      backgroundColor: finIMColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            FinaiRegisterImageView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                children: [
                  AddUserName(),
                  const SizedBox(
                    width: 16,
                  ),
                  AddUserSurname(),
                ],
              ),
            ),
            AddUserPhone(),
            AddUserPassword(),
            AddUserButton(),
          ],
        ),
      ),
    );
  }
}
