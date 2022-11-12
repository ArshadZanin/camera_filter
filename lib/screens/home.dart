import 'dart:io';

import 'package:camera_filter/controllers/home_controller.dart';
import 'package:camera_filter/screens/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () {
              Get.to(CameraScreen());
            },
          ),
        ],
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            children: List.generate(
              controller.paths.length,
              (index) => _buildImageCard(
                controller.paths[index],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildImageCard(String path) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(
            File(path),
            height: 100,
            width: 110,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(path.split('/').last),
        ],
      ),
    );
  }
}
