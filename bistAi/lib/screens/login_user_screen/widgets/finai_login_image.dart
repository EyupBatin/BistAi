import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class FinaiLoginImageView extends StatelessWidget {
  const FinaiLoginImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 80, 0, 15),

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
