import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color.dart';
import '../../../controllers/user_controller.dart';

class EditUserPhone extends StatelessWidget {
  final TextEditingController controller;

  EditUserPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // `loadUserData()` fonksiyonunu burada çağırabilirsiniz,
    // ancak veri yüklenmeden önce bir yavaşlık olabilir.

    // Bu nedenle FutureBuilder kullanacağız
    final userController = Get.find<UserController>();

    return FutureBuilder(
      future: userController.loadUserData(), // Verileri yükle
      builder: (context, snapshot) {
        // Veri yükleniyorsa bir yükleme göstergesi ekleyelim
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        controller.text = userController.userPhone.text;

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
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Phone',
                border: InputBorder.none,
              ),
            ),
          ),
        );
      },
    );
  }
}
