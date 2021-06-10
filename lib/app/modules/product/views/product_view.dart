import 'package:badges/badges.dart';
import 'package:car_rental/app/models/car_model.dart';
import 'package:car_rental/app/modules/home/controllers/home_controller.dart';
import 'package:car_rental/app/routes/app_pages.dart';
import 'package:car_rental/app/widgets/car_images_widget.dart';
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

                ///available cars
                GestureDetector(
                  onTap: () => Get.find<HomeController>().changePage(1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Container(
                      decoration: BoxDecoration(color: Config.primaryColor, borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: const EdgeInsets.all(24),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Avaiable Cars", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text("Long term and short term", style: TextStyle(fontSize: 16, color: Colors.white)),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(Icons.arrow_forward_ios, color: Config.primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                ///Top dealers
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TOP DEALS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[400])),
                      GestureDetector(
                        onTap: () => Get.find<HomeController>().changePage(2),
                        child: Row(
                          children: [
                            Text("More", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Config.primaryColor)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios, size: 12, color: Config.primaryColor)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: controller.cars
                        .map(
                          (car) => GestureDetector(
                            onTap: () => Get.find<HomeController>().changePage(3),
                            child: buildCar(car, controller.cars.indexOf(car)),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCar(Car car, [int? idx]) {
    // print("-----${car.brand}");

    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(right: idx != null ? 16 : 0, left: idx == 0 ? 16 : 0),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Config.primaryColorShadow,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  car.condition!,
                  style: TextStyle(color: Config.primaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 115,
            child: Center(
              child: Hero(
                tag: car.model!,
                child: Image.asset(car.images!.first, fit: BoxFit.fitWidth),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(car.model!, style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text(car.brand!,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              )),
          Text(
            """per ${car.condition == 'Daily' ? 'day' : car.condition == 'Weekly' ? 'week' : 'month'}""",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          )
        ],
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
          CarImagesWidget(images: controller.displayCar.images!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.displayCar.model!, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Config.primaryColor)),
                    Text(controller.displayCar.brand!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                Row(
                  children: [
                    Text("My Garage", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Config.primaryColor)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 23, color: Config.primaryColor)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
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
