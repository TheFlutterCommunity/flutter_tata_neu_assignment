import 'package:flutter/material.dart';
import 'package:flutter_tata_neu_assignment/core/enums/view_state.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperUtils {
  static Widget widgetWithLoader({@required Widget? child, ViewState? state}) {
    return Stack(
      children: [child!, if (state == ViewState.busy) buildLoader()],
    );
  }

  static Widget buildLoader() {
    return Container(
      color: Colors.grey.withOpacity(0.4),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void showToast(
      {required String message,
      Toast length = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      toastLength: length, // length
      gravity: gravity,
      //timeInSecForIos: 1               // duration
    );
  }
}
