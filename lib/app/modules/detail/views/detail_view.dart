import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    print("-0-0-0-0-0--0 Detail View build");

    return Scaffold(
      appBar: AppBar(
        title: Text('DetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("will be rebuild many times"),
            ElevatedButton(
              child: Text("返回"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
