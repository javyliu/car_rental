import 'package:get/get.dart';

import '../controllers/book_car_controller.dart';

class BookCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookCarController>(
      () => BookCarController(),
    );
  }
}
