import 'package:admin_menu_example/controllers/user_controller.dart';
import 'package:admin_menu_example/screens/edit_user_screen/widgets/custom_edit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color.dart';
import 'widgets/edit_user_name.dart';
import 'widgets/edit_user_surname.dart';
import 'widgets/edit_user_phone.dart';
import 'widgets/edit_user_password.dart';

class EditUser extends StatelessWidget {
  EditUser({super.key});

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final surnameController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: const CustomEditAppBar(),
      backgroundColor: finIMColor,
      body: FutureBuilder(
        future: userController.loadUserData(), // Kullanıcı verilerini yükle
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Veri yükleniyorsa yükleme göstergesi
          }

          // Eğer veriler başarılı bir şekilde yüklendiyse, TextEditingController'lara değerleri yerleştir
          nameController.text = userController.userName.text;
          surnameController.text = userController.userSurname.text;
          phoneController.text = userController.userPhone.text;
          passwordController.text = userController.userPassword.text;

          return SingleChildScrollView(
            padding: EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      EditUserName(controller: nameController),
                      const SizedBox(width: 16),
                      EditUserSurname(controller: surnameController),
                    ],
                  ),
                ),
                EditUserPhone(controller: phoneController),
                EditUserPassword(controller: passwordController),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Kullanıcı bilgilerini güncelle ve kaydet
                      userController.userName.text = nameController.text;
                      userController.userSurname.text = surnameController.text;
                      userController.userPhone.text = phoneController.text;
                      userController.userPassword.text = passwordController.text;

                      await userController.saveUserData();

                      Get.snackbar(
                        "Başarılı",
                        "Kullanıcı bilgileri güncellendi.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.withOpacity(0.8),
                        colorText: Colors.white,
                      );
                    },
                    child: const Text("Bilgileri Güncelle"),
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
