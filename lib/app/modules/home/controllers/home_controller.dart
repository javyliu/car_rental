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
  final animationDuration = const Duration(milliseconds: 300);

  @override
  void onInit() {
    super.onInit();
  }

  var currentIndex = 0.obs;
  final currentPage = ''.obs;
  final List<int> history = [];
  @override
  void onReady() {
    super.onReady();
    history.add(currentIndex.value);
  }

  final pages = <String>[Routes.PRODUCT, Routes.SEARCH, Routes.MESSAGES, Routes.PROFILE];
  final pageTitles = <String>['首页', '搜索', '消息', '设置'];

  void changePage(int index) {
    print("-----change page");

    currentIndex.value = index;
    // currentPage.value = pageTitles[index];
    // Get.toNamed(pages[index], id: 1);
    // print("=======nav_1: ${Get.global(1).currentState}");
    // print("----------$navigator");
    // // Get.until((route) => route.settings.name == Routes.HOME);

    // // Get.offAllNamed(pages[index], id: 1);
    // if (history.contains(index)) {
    //   // Get.until(ModalRoute.withName(pages[index]), id: 1);
    //   history.removeRange(history.indexOf(index) + 1, history.length);

    //   Get.until((route) {
    //     print("Get until to ==${route.settings.name}");
    //     return route.settings.name == pages[index];
    //   }, id: 1);
    // } else {
    //   history.add(index);

    // Get.toNamed(pages[index], id: 1);
    // }

    // Get.global(1).currentState?.restorablePopAndPushNamed(pages[index]);
    // Get.global(1).currentState?.restorablePushNamed(pages[index]);
    // Get.global(1).currentState?.popUntil((route) {
    //   print("-------$route");

    // Get.until((route) {
    //   print("--------$route");
    //   return '/search' == pages[index];
    // });

    //   return route.isFirst;
    // });
    // Get.toNamed(pages[index], id: 1);
    // Get.offAndToNamed(pages[index], id: 1);
    // Get.offNamedUntil(page, (route) => false)

    // Get.offAndToNamed(pages[index], id: 1);
    // navigator.popAndPushNamed(pages[index]);

    // navigator!.pushNamed(pages[index]);
  }

  final routes = {
    Routes.SEARCH: () => GetPageRoute(settings: RouteSettings(name: Routes.SEARCH), page: () => SearchView(), binding: SearchBinding()),
    Routes.MESSAGES: () => GetPageRoute(settings: RouteSettings(name: Routes.MESSAGES), page: () => MessagesView(), binding: MessagesBinding()),
    Routes.PROFILE: () => GetPageRoute(settings: RouteSettings(name: Routes.PROFILE), page: () => ProfileView(), binding: ProfileBinding()),
    Routes.PRODUCT: () => GetPageRoute(settings: RouteSettings(name: Routes.PRODUCT), page: () => ProductView(), binding: ProductBinding()),
  };

  Route? onGenerateRoute(RouteSettings settings) {
    print("------setting is $settings");

    if (settings.name == "/") return null;

    return routes[settings.name]!();
  }

  @override
  void onClose() {
    pageController.dispose();
    print("---------home controller closed");
  }
}
