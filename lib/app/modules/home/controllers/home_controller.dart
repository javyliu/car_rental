import 'package:car_rental/app/modules/messages/bindings/messages_binding.dart';
import 'package:car_rental/app/modules/messages/views/messages_view.dart';
import 'package:car_rental/app/modules/product/bindings/product_binding.dart';
import 'package:car_rental/app/modules/product/views/product_view.dart';
import 'package:car_rental/app/modules/profile/bindings/profile_binding.dart';
import 'package:car_rental/app/modules/profile/views/profile_view.dart';
import 'package:car_rental/app/modules/search/bindings/search_binding.dart';
import 'package:car_rental/app/modules/search/views/search_view.dart';
import 'package:car_rental/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  final animationduration = Duration(milliseconds: 300);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var currentIndex = 0.obs;
  final currentPage = ''.obs;

  final pages = <String>[Routes.PRODUCT, Routes.SEARCH, Routes.MESSAGES, Routes.PROFILE];
  final pageTitles = <String>['首页', '搜索', '消息', '设置'];

  void changePage(int index) {
    currentIndex.value = index;
    // currentPage.value = pageTitles[index];
    Get.toNamed(pages[index], id: 1);
    // Get.offAndToNamed(pages[index], id: 1);
    //navigator.popAndPushNamed(pages[index]);
  }

  Route onGenerateRoute(RouteSettings settings) {
    GetPageRoute rt;
    switch (settings.name) {
      case Routes.SEARCH:
        rt = GetPageRoute(
          settings: settings,
          page: () => SearchView(),
          binding: SearchBinding(),
        );
        break;
      case Routes.MESSAGES:
        rt = GetPageRoute(
          settings: settings,
          page: () => MessagesView(),
          binding: MessagesBinding(),
        );
        break;
      case Routes.PROFILE:
        rt = GetPageRoute(
          settings: settings,
          page: () => ProfileView(),
          binding: ProfileBinding(),
        );
        break;
      default:
        rt = GetPageRoute(
          settings: settings,
          page: () => ProductView(),
          binding: ProductBinding(),
        );
    }
    return rt;
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
