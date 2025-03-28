import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/color.dart';
import '../../../../controllers/user_controller.dart';
class RiskAnalysisButton extends StatefulWidget {
  final Function calculateRiskProfile;
  const RiskAnalysisButton({super.key, required this.calculateRiskProfile});

  @override
  State<RiskAnalysisButton> createState() => _RiskAnalysisButtonState();
}

class _RiskAnalysisButtonState extends State<RiskAnalysisButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5),
        child: ElevatedButton(
          onPressed: () {
            // Call the calculateRiskProfile and then save the result
            widget.calculateRiskProfile();
            String riskProfile = widget.calculateRiskProfile();
            // Save the calculated risk profile
            final userController = Get.find<UserController>();
            userController.saveRiskProfile(riskProfile);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: finLGColor,
          ),
          child: const Text(
            'SAVE',
            style: TextStyle(
              letterSpacing: 0.7,
              fontSize: 16,
              color: Colors.white,
              fontFamily: "Montserrat",
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
