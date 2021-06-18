import 'package:car_rental/app/modules/messages/views/messages_view.dart';
import 'package:car_rental/app/modules/product/views/product_view.dart';
import 'package:car_rental/app/modules/profile/views/profile_view.dart';
import 'package:car_rental/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print("-0-0--0-home view build");

    return Scaffold(
      body: Obx(
        // () => Stack(
        //   children: [
        // Offstage(child: ProductView(), offstage: controller.currentIndex.value != 0),
        // Offstage(child: SearchView(), offstage: controller.currentIndex.value != 1),
        // Offstage(child: MessagesView(), offstage: controller.currentIndex.value != 2),
        // Offstage(child: ProfileView(), offstage: controller.currentIndex.value != 3),

        // ],
        //  )
        () => IndexedStack(
          children: [
            ProductView(),
            SearchView(),
            MessagesView(),
            ProfileView(),
          ],
          index: controller.currentIndex.value,
        ),
      ),
      // Navigator(
      //   key: Get.nestedKey(1),
      //   // key: _navigatorKey,
      //   initialRoute: Routes.PRODUCT,
      //   restorationScopeId: "nav_1",
      //   // onGenerateInitialRoutes: (navigator, initialRoute) {
      //   //   print("=======$navigator, $initialRoute");
      //   //   return [
      //   //     GetPageRoute(settings: RouteSettings(name: Routes.SEARCH), page: () => SearchView(), binding: SearchBinding()),
      //   //     GetPageRoute(settings: RouteSettings(name: Routes.MESSAGES), page: () => MessagesView(), binding: MessagesBinding()),
      //   //     GetPageRoute(settings: RouteSettings(name: Routes.PROFILE), page: () => ProfileView(), binding: ProfileBinding()),
      //   //     GetPageRoute(settings: RouteSettings(name: Routes.PRODUCT), page: () => ProductView(), binding: ProductBinding()),
      //   //   ];
      //   // },

      //   onGenerateRoute: controller.onGenerateRoute,
      //   // pages: [
      //   //   GetPage(
      //   //     name: Routes.PRODUCT,
      //   //     page: () => ProductView(),
      //   //     binding: ProductBinding(),
      //   //   ),
      //   //   GetPage(
      //   //     name: Routes.SEARCH,
      //   //     page: () => SearchView(),
      //   //     binding: SearchBinding(),
      //   //   ),
      //   //   GetPage(
      //   //     name: Routes.MESSAGES,
      //   //     page: () => MessagesView(),
      //   //     binding: MessagesBinding(),
      //   //   ),
      //   //   GetPage(
      //   //     name: Routes.PROFILE,
      //   //     page: () => ProfileView(),
      //   //     binding: ProfileBinding(),
      //   //   ),
      //   // ],
      //   // restorationScopeId: "home_state",
      // ),
      // body: GetNavigator(
      //   initialRoute: Routes.PRODUCT,
      //   getPages: [
      //     GetPage(
      //       name: Routes.PRODUCT,
      //       page: () => ProductView(),
      //       binding: ProductBinding(),
      //     ),
      //     GetPage(
      //       name: Routes.SEARCH,
      //       page: () => SearchView(),
      //       binding: SearchBinding(),
      //     ),
      //     GetPage(
      //       name: Routes.MESSAGES,
      //       page: () => MessagesView(),
      //       binding: MessagesBinding(),
      //     ),
      //     GetPage(
      //       name: Routes.PROFILE,
      //       page: () => ProfileView(),
      //       binding: ProfileBinding(),
      //     ),
      //   ],
      //   onPopPage: (route, result) => true,
      //   // onGenerateRoute: controller.onGenerateRoute,
      // ),
      // bottomNavigationBar: ValueBuilder<int?>(
      //   initialValue: 0,
      //   builder: (value, updaterFn) {
      //     return BottomNavigationBar(
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home_outlined),
      //           label: '首页',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.search_outlined),
      //           label: '搜索',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.message_outlined),
      //           label: '消息',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.person_outline),
      //           label: '设置',
      //         ),
      //       ],
      //       currentIndex: value!,
      //       onTap: (val) {
      //         controller.pageController.animateToPage(val, duration: controller.animationDuration, curve: Curves.ease);
      //         updaterFn(val);
      //       },
      //       unselectedFontSize: 12,
      //       selectedFontSize: 12,
      //       showUnselectedLabels: true,
      //       selectedItemColor: Colors.green,
      //       iconSize: 24,
      //       type: BottomNavigationBarType.fixed,
      //       elevation: 0,
      //     );
      //   },
      // ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: '搜索',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: '消息',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '设置',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          showUnselectedLabels: true,
          selectedItemColor: Colors.green,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }
}
