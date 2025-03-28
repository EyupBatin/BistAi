import 'package:admin_menu_example/constants/color.dart';
import 'package:flutter/material.dart';

class FinaiRegisterImageView extends StatelessWidget {
  const FinaiRegisterImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 15),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: finGrey,
            blurRadius: 30,
            spreadRadius: 5,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: const CircleAvatar(
        backgroundImage: AssetImage('assets/finai_logo2.png'),
        radius: 50.0,
      ),
    );
  }
}
