import 'package:camera_filter/controllers/camera_controller.dart';
import 'package:camera_filters/camera_filters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({Key? key}) : super(key: key);
  final controller = Get.put(CameraController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraScreenPlugin(
        onDone: (value) async => controller.onSaveImage(
          value.toString(),
        ),
      ),
    );
  }
}
