import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MessagesView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
