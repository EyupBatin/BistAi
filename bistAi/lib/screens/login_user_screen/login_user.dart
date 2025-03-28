import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/controllers/user_controller.dart';
import 'package:admin_menu_example/screens/login_user_screen/widgets/custom_login_app_bar.dart';
import 'package:admin_menu_example/screens/login_user_screen/widgets/finai_login_image.dart';
import 'package:admin_menu_example/screens/login_user_screen/widgets/login_user_button.dart';
import 'package:admin_menu_example/screens/login_user_screen/widgets/login_user_password.dart';
import 'package:admin_menu_example/screens/login_user_screen/widgets/login_user_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_user_screen/add_user.dart';

class LoginUser extends StatelessWidget {
  LoginUser({super.key});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: finIMColor,
      appBar: CustomLoginAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FinaiLoginImageView(),
            LoginUserPhone(phoneController: userController.getUserPhoneController()),
            // UserController'daki passwordController kullanılıyor
            LoginUserPassword(passwordController: userController.getUserPasswordController()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                LoginUserButton(
                  phoneController: userController.getUserPhoneController(),
                  passwordController: userController.getUserPasswordController(),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: finGrey,
                        offset: Offset(0, 0),
                        blurRadius: 30.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => AddUser());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: finIMColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    ),
                    child: const Text(
                      'Kayıt ol ekranına git',
                      style: TextStyle(
                        letterSpacing: 0.7,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
