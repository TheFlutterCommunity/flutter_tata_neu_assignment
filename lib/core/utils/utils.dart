import 'package:flutter/services.dart';

class Utils {
  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static Future<String> getJsonFromAssets(String assetPath) async {
    try {
      return await rootBundle.loadString(assetPath);
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
