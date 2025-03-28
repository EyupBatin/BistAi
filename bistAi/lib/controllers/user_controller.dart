import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../repository/data_repository.dart';
import 'dart:convert';
class UserController extends GetxController {
  late TextEditingController userName = TextEditingController();
  late TextEditingController userSurname = TextEditingController();
  late TextEditingController userPhone = TextEditingController();
  late TextEditingController userPassword = TextEditingController();
  String? risk;
  final DataRepository _dataRepository = DataRepository();

  TextEditingController getUserNameController() {
    return userName;
  }

  TextEditingController getUserSurnameController() {
    return userSurname;
  }

  TextEditingController getUserPhoneController() {
    return userPhone;
  }

  TextEditingController getUserPasswordController() {
    return userPassword;
  }
  Future<void> saveRiskProfile(String riskProfile) async {
    risk = riskProfile; // Set the risk profile
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userRisk', riskProfile); // Save to SharedPreferences
  }
  Future<void> loadRiskProfile() async {
    final prefs = await SharedPreferences.getInstance();
    risk = prefs.getString('userRisk'); // Load from SharedPreferences
  }
// Veri kaydetme fonksiyonu
  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName.text);
    await prefs.setString('userSurname', userSurname.text);
    await prefs.setString('userPhone', userPhone.text);
    await prefs.setString('userPassword', userPassword.text);
  }

  // Load all user data
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userName.text = prefs.getString('userName') ?? '';
    userSurname.text = prefs.getString('userSurname') ?? '';
    userPhone.text = prefs.getString('userPhone') ?? '';
    userPassword.text = prefs.getString('userPassword') ?? '';
  }

  // Save last logged-in user data
  Future<void> saveLastLoggedInUser(String name, String surname, String phone, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // Kullanıcı verilerini kaydet
    await prefs.setString('lastLoggedInName', name);
    await prefs.setString('lastLoggedInSurname', surname);
    await prefs.setString('lastLoggedInPhone', phone);
    await prefs.setString('lastLoggedInPassword', password);

    // Kullanıcının risk profilini yükle
    await loadRiskProfile();

    // Eğer risk profili yoksa, null başlatıyoruz
    if (risk == null) {
      risk = null;
    }

    // Sonuç olarak son giriş yapan kullanıcının verilerini kaydettik
  }

  // Load last logged-in user data
  Future<Map<String, String?>> loadLastLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('lastLoggedInName'),
      'surname': prefs.getString('lastLoggedInSurname'),
      'phone': prefs.getString('lastLoggedInPhone'),
      'password': prefs.getString('lastLoggedInPassword'),
      'risk': prefs.getString('userRisk'), // Risk profilini de dahil et
    };
  }

  // Clear data from SharedPreferences
  Future<void> clearUserData() async {
    await _dataRepository.clearUserData();
    userName.clear();
    userSurname.clear();
    userPhone.clear();
    userPassword.clear();
  }





  // Load stored phone from SharedPreferences
  Future<String?> loadPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone');
  }

  // Load stored password from SharedPreferences
  Future<String?> loadPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }


}
