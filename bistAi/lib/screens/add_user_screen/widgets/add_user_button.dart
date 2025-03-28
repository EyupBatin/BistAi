import 'dart:convert';

import 'package:admin_menu_example/constants/color.dart';
import 'package:admin_menu_example/pages/myApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/user_controller.dart';
import 'package:http/http.dart' as http;

class AddUserButton extends StatelessWidget {
  AddUserButton({super.key});

  final UserController userController = Get.put(UserController());

  Future<void> sendUserDataToApi(
      String name, String surname, String phoneNumber, String password) async {
    final String apiUrl =
        "http://127.0.0.1:5000/api/register"; // API URL'inizi buraya yazın

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'surname': surname,
          'phone_number': phoneNumber,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print("User data sent successfully!");
      } else {
        print("Failed to send user data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
          onPressed: () async {
            await userController.saveUserData();
            Get.snackbar('Success', 'User registered successfully!',
                snackPosition: SnackPosition.BOTTOM);
            sendUserDataToApi(
                userController.getUserNameController() as String,
                userController.getUserSurnameController() as String,
                userController.getUserPhoneController() as String,
                userController.getUserPasswordController() as String);
            Get.toNamed('/loginUser'); // Navigate to LoginScreen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: finIMColor,
          ),
          child: const Text(
            'REGISTER',
            style: TextStyle(
              letterSpacing: 0.7,
              fontSize: 16,
              // Increase the font size
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
