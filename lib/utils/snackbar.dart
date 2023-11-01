import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String message,
    {bool error = true, String title = "Error", Color color = Colors.red}) {
  Get.snackbar(title, message,
      backgroundColor: color,
      snackPosition: SnackPosition.TOP,
      colorText: const Color.fromRGBO(255, 255, 255, 1),
      titleText: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white),
      ));
}
