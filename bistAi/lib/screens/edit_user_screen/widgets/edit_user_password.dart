import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class EditUserPassword extends StatelessWidget {
  final TextEditingController controller;

  EditUserPassword({super.key, required this.controller});

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
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
