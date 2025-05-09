import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showError(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
      fontSize: 16.0);
}
