import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/screens/menu_page_screens/dashboard_page_screen/dashboardPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';
class LoginUserButton extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  LoginUserButton({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 10),
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
        alignment: Alignment.centerRight, // Button'ı sağa hizalayacak
        child: ElevatedButton(
          onPressed: () async {
            // Load all user data
            await userController.loadUserData();

            // Check if user data exists
            if (userController.userPhone.text.isEmpty || userController.userPassword.text.isEmpty) {
              // Show error message if no user data is available
              Get.snackbar(
                'Hata',
                'Kullanıcı bulunamadı, lütfen önce kaydolun.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red.withOpacity(0.8),
                colorText: Colors.white,
              );
              return;
            }

            // Validate user input using the loaded data
            if (phoneController.text == userController.userPhone.text &&
                passwordController.text == userController.userPassword.text) {
              // Save the logged-in user's full data
              await userController.saveLastLoggedInUser(
                userController.userName.text,
                userController.userSurname.text,
                phoneController.text,
                passwordController.text,
              );

              // Show success message
              Get.snackbar(
                'Başarı',
                'Giriş Başarılı!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.8),
                colorText: Colors.white,
              );

              // Navigate to the Dashboard
              Get.toNamed('myApp');
            } else {
              // Show error message for invalid phone or password
              Get.snackbar(
                'Hata',
                'Geçersiz telefon veya şifre',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red.withOpacity(0.8),
                colorText: Colors.white,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: finIMColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
          child: const Text(
            'Giriş yap',
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
    );
  }
}
