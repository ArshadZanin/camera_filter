import 'package:get/get.dart';

class SnackBar{
  static void show(String title,String disc){
    Get.snackbar(
        title,
        disc,
        snackPosition: SnackPosition.BOTTOM,
      );
  }
}