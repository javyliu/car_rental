import 'package:car_rental/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.PRODUCT,
        onGenerateRoute: controller.onGenerateRoute,
      ),
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
