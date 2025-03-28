import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class EditUserSurname extends StatelessWidget {
  final TextEditingController controller;

  EditUserSurname({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            hintText: 'Surname',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
