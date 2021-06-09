import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../config.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///app bar
          _buildAppBar(),
          SizedBox(height: 22),
        ],
      ),
    );
  }

  Container _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            child: Stack(
              children: [
                CircularStepProgressIndicator(
                  totalSteps: 100,
                  padding: 0,
                  currentStep: 80,
                  selectedStepSize: 4,
                  width: 80,
                  height: 80,
                  startingAngle: 2.3,
                  selectedColor: Colors.yellow[600],
                  unselectedColor: Colors.white,
                  roundedCap: (_, __) {
                    // print("$_, $__");
                    return true;
                  },
                  child: Center(
                    child: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: AssetImage('assets/images/users/faisal-ramdan.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Badge(
                    shape: BadgeShape.square,
                    animationType: BadgeAnimationType.scale,
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2.2),
                    borderRadius: BorderRadius.circular(13),
                    badgeColor: Colors.yellow[600]!,
                    elevation: 0,
                    badgeContent: Text("Gold", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      child: Text("IDR", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                    Text("17,7jt", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Config.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Icon(Icons.add, color: Colors.green, size: 23),
              )
            ],
          ),
        ],
      ),
    );
  }
}
