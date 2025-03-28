
import 'package:shared_preferences/shared_preferences.dart';

class DataRepository {
  static const _userNameKey = 'userName';
  static const _userSurnameKey = 'userSurname';
  static const _userPhoneKey = 'userPhone';
  static const _userPasswordKey = 'userPassword';

  Future<void> saveUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, userName);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  Future<void> saveUserSurname(String userSurname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userSurnameKey, userSurname);
  }

  Future<String?> getUserSurname() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userSurnameKey);
  }

  Future<void> saveUserPhone(String userPhone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPhoneKey, userPhone);
  }

  Future<String?> getUserPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPhoneKey);
  }

  Future<void> saveUserPassword(String userPassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPasswordKey, userPassword);
  }

  Future<String?> getUserPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userPasswordKey);
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
    await prefs.remove(_userSurnameKey);
    await prefs.remove(_userPhoneKey);
    await prefs.remove(_userPasswordKey);
  }
}

