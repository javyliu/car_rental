import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    print("---------profile view build");

    return Center(
      child: Text(
        'ProfileView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
