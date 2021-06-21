import 'package:car_rental/app/modules/messages/controllers/messages_controller.dart';
import 'package:car_rental/app/modules/product/controllers/product_controller.dart';
import 'package:car_rental/app/modules/profile/controllers/profile_controller.dart';
import 'package:car_rental/app/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
