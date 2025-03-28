import 'package:admin_menu_example/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../pages/MyScaffold.dart';

class RiskAnalysisForm extends StatefulWidget {
  @override
  State<RiskAnalysisForm> createState() => _RiskAnalysisFormState();
}

enum howMuchAge { age18to35, age36to50, age51plus }

enum investmentExperience { year1minus, year1to5, year5plus }

enum financialStatus { stabil, medium, undecided }

enum investmentTargets { longTerm, regularIncome, capitalProtection }

enum riskTolerances { lowTolerances, mediumTolerances, highTolerances }

class _RiskAnalysisFormState extends State<RiskAnalysisForm> {
  howMuchAge? _age = null;
  investmentExperience? _experience = null;
  financialStatus? _financial = null;
  investmentTargets? _targets = null;
  riskTolerances? _tolerances = null;

  String riskProfile = "";

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/secondLevelItem1',
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Age Question
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Yaşınız kaç',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.7,
                  ),
                )),
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('18-35'),
                  leading: Radio<howMuchAge>(
                    value: howMuchAge.age18to35,
                    groupValue: _age,
                    onChanged: (howMuchAge? value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('36-50'),
                  leading: Radio<howMuchAge>(
                    value: howMuchAge.age36to50,
                    groupValue: _age,
                    onChanged: (howMuchAge? value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('51+'),
                  leading: Radio<howMuchAge>(
                    value: howMuchAge.age51plus,
                    groupValue: _age,
                    onChanged: (howMuchAge? value) {
                      setState(() {
                        _age = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Investment Experience Question
            Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Yatırım tecrübeniz nedir',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.7,
                      ),
                    )),
                ListTile(
                  title: Text('1 yıldan az'),
                  leading: Radio<investmentExperience>(
                      value: investmentExperience.year1minus,
                      groupValue: _experience,
                      onChanged: (investmentExperience? value) {
                        setState(() {
                          _experience = value;
                        });
                      }),
                ),
                ListTile(
                  title: Text('1-5 yıl arası'),
                  leading: Radio<investmentExperience>(
                      value: investmentExperience.year1to5,
                      groupValue: _experience,
                      onChanged: (investmentExperience? value) {
                        setState(() {
                          _experience = value;
                        });
                      }),
                ),
                ListTile(
                  title: Text('5 yıldan fazla'),
                  leading: Radio<investmentExperience>(
                      value: investmentExperience.year5plus,
                      groupValue: _experience,
                      onChanged: (investmentExperience? value) {
                        setState(() {
                          _experience = value;
                        });
                      }),
                ),
              ],
            ),
            // Financial Status Question
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Finansal durumunuz nedir',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Stabil'),
                  leading: Radio<financialStatus>(
                    value: financialStatus.stabil,
                    groupValue: _financial,
                    onChanged: (financialStatus? value) {
                      setState(() {
                        _financial = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Normal'),
                  leading: Radio<financialStatus>(
                    value: financialStatus.medium,
                    groupValue: _financial,
                    onChanged: (financialStatus? value) {
                      setState(() {
                        _financial = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Kararsız'),
                  leading: Radio<financialStatus>(
                    value: financialStatus.undecided,
                    groupValue: _financial,
                    onChanged: (financialStatus? value) {
                      setState(() {
                        _financial = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Investment Targets Question
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Yatırım hedefleriniz nedir',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Uzun vadeli büyüme'),
                  leading: Radio<investmentTargets>(
                    value: investmentTargets.longTerm,
                    groupValue: _targets,
                    onChanged: (investmentTargets? value) {
                      setState(() {
                        _targets = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Düzenli gelir elde etme'),
                  leading: Radio<investmentTargets>(
                    value: investmentTargets.regularIncome,
                    groupValue: _targets,
                    onChanged: (investmentTargets? value) {
                      setState(() {
                        _targets = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Sermayeyi koruma'),
                  leading: Radio<investmentTargets>(
                    value: investmentTargets.capitalProtection,
                    groupValue: _targets,
                    onChanged: (investmentTargets? value) {
                      setState(() {
                        _targets = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Risk Tolerances Question
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Risk toleransınız nedir',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.7),
                  ),
                ),
                ListTile(
                  title: Text('Düşük'),
                  leading: Radio<riskTolerances>(
                    value: riskTolerances.lowTolerances,
                    groupValue: _tolerances,
                    onChanged: (riskTolerances? value) {
                      setState(() {
                        _tolerances = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Orta'),
                  leading: Radio<riskTolerances>(
                    value: riskTolerances.mediumTolerances,
                    groupValue: _tolerances,
                    onChanged: (riskTolerances? value) {
                      setState(() {
                        _tolerances = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Yüksek'),
                  leading: Radio<riskTolerances>(
                    value: riskTolerances.highTolerances,
                    groupValue: _tolerances,
                    onChanged: (riskTolerances? value) {
                      setState(() {
                        _tolerances = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            // Calculate Button
            ElevatedButton(
              onPressed: _calculateRiskProfile,
              child: Text(
                'Hesapla',
                style: TextStyle(
                  letterSpacing: 0.7,
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                  fontStyle: FontStyle.normal,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: finDarkIMColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
            // Display Result
            Text(
              riskProfile,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  String _calculateRiskProfile() {
    // Reset the riskProfile before starting calculations
    setState(() {
      riskProfile = "";
    });

    // Check for null values and update the riskProfile with appropriate message
    if (_age == null) {
      setState(() {
        riskProfile = "Yaşınızı lütfen seçiniz.";
      });
      return riskProfile;
    }
    if (_experience == null) {
      setState(() {
        riskProfile = "Yatırım tecrübenizi lütfen seçiniz.";
      });
      return riskProfile;
    }
    if (_financial == null) {
      setState(() {
        riskProfile = "Finansal durumunuzu lütfen seçiniz.";
      });
      return riskProfile;
    }
    if (_targets == null) {
      setState(() {
        riskProfile = "Yatırım hedeflerinizi lütfen seçiniz.";
      });
      return riskProfile;
    }
    if (_tolerances == null) {
      setState(() {
        riskProfile = "Risk toleransınızı lütfen seçiniz.";
      });
      return riskProfile;
    }

    int score = 0;

    // Assigning scores
    score += _age == howMuchAge.age18to35
        ? 3
        : _age == howMuchAge.age36to50
        ? 2
        : 1;
    score += _experience == investmentExperience.year5plus
        ? 3
        : _experience == investmentExperience.year1to5
        ? 2
        : 1;
    score += _financial == financialStatus.stabil
        ? 3
        : _financial == financialStatus.medium
        ? 2
        : 1;
    score += _targets == investmentTargets.longTerm
        ? 3
        : _targets == investmentTargets.regularIncome
        ? 2
        : 1;
    score += _tolerances == riskTolerances.highTolerances
        ? 3
        : _tolerances == riskTolerances.mediumTolerances
        ? 2
        : 1;

    // Determine risk profile
    setState(() {
      if (score <= 7) {
        riskProfile = "Düşük Risk";
      } else if (score <= 12) {
        riskProfile = "Orta Risk";
      } else {
        riskProfile = "Yüksek Risk";
      }
    });

    return riskProfile; // Return the calculated risk profile
  }

}
