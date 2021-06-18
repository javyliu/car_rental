import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    print("---------0-0-0Search view build-------");

    return Center(
      child: Text(
        'SearchView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
