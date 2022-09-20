import 'dart:developer';

import 'package:flutter_tata_neu_assignment/core/constants/prefs_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {

  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<int> getInt(String key, int value) async {
    return prefs!.getInt(key) ?? value;
  }

  static setInt(String key, int value) async {
    prefs!.setInt(key, value);
  }

  static setString(String key, String? value) async {
    await prefs!.setString(key, value!);
  }

  static Future<String> getString(String key, String value) async {
    return prefs!.getString(key) ?? value;
  }

  static setBool(String key, bool value) async {
    prefs!.setBool(key, value);
  }

  static Future<bool> getBool(String key, bool value) async {
    return prefs!.getBool(key) ?? value;
  }

  static setDouble(String key, double value) async {
    prefs!.setDouble(key, value);
  }

  static Future<double> getDouble(String key, double value) async {
    return prefs!.getDouble(key) ?? value;
  }

  static Future<bool> remove(String key) async {
    return prefs!.remove(key);
  }

  static Future<void> createUserSession(
      int userId, String token, String mobileNo) async {
    log("createUserSession::");
    await PrefsHelper.setInt(keyUserId, userId);
    await PrefsHelper.setString(keyToken, token);
    await PrefsHelper.setString(keyMobileNo, mobileNo);
    await PrefsHelper.setBool(keyIsLoggedIn, true);
    log("createUserSession:: USER_ID:: $userId :: TOKEN:: $token :: MOBILE_NO::$mobileNo");
  }

  static setIsLoggedIn(bool isLoggedIn) async {
    await PrefsHelper.setBool(keyIsLoggedIn, isLoggedIn);
  }

  static Future<bool> isLoggedIn() async {
    return await PrefsHelper.getBool(keyIsLoggedIn, false);
  }

  static clear() async {
    prefs!.clear();
  }
}
