import 'package:car_rental/app/modules/messages/views/messages_view.dart';
import 'package:car_rental/app/modules/product/views/product_view.dart';
import 'package:car_rental/app/modules/profile/views/profile_view.dart';
import 'package:car_rental/app/modules/search/views/search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ProductView(),
          SearchView(),
          MessagesView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: ValueBuilder<int?>(
        initialValue: 0,
        builder: (snapshot, updater) => BottomNavigationBar(
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
          currentIndex: snapshot!,
          onTap: (value) {
            controller.pageController.animateToPage(value, duration: controller.animationduration, curve: Curves.ease);
            updater(value);
          },
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
