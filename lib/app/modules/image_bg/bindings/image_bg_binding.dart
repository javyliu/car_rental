import 'package:get/get.dart';

import '../controllers/image_bg_controller.dart';

class ImageBgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageBgController>(
      () => ImageBgController(),
    );
  }
}
