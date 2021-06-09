import 'package:get/get.dart';

import 'package:car_rental/app/modules/home/bindings/home_binding.dart';
import 'package:car_rental/app/modules/home/views/home_view.dart';
import 'package:car_rental/app/modules/messages/bindings/messages_binding.dart';
import 'package:car_rental/app/modules/messages/views/messages_view.dart';
import 'package:car_rental/app/modules/product/bindings/product_binding.dart';
import 'package:car_rental/app/modules/product/views/product_view.dart';
import 'package:car_rental/app/modules/profile/bindings/profile_binding.dart';
import 'package:car_rental/app/modules/profile/views/profile_view.dart';
import 'package:car_rental/app/modules/search/bindings/search_binding.dart';
import 'package:car_rental/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
