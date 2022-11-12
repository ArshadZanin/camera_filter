import 'package:camera_filter/controllers/home_controller.dart';
import 'package:camera_filter/widgets/snackbar.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

class CameraController extends GetxController {
  final homeController = Get.put(HomeController());
  String? path;

  Future<void> onSaveImage(String imagePath) async {
    path = imagePath;
    homeController.paths.add(imagePath);
    Get.back();
    bool? isSaved =
        await GallerySaver.saveImage(path!, albumName: 'Filter Camera');
    if (isSaved ?? false) {
      SnackBar.show('Saved', 'Image save to gallery');
    }
    update();
    homeController.update();
  }
}
