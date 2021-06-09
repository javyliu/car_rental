import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ProductView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
