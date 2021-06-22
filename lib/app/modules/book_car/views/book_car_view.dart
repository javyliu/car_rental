import 'package:car_rental/app/models/car_model.dart';
import 'package:car_rental/app/widgets/app_bar_widget.dart';
import 'package:car_rental/app/widgets/car_images_widget.dart';
import 'package:car_rental/app/widgets/car_name_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config.dart';
import '../controllers/book_car_controller.dart';

class BookCarView extends GetView<BookCarController> {
  @override
  Widget build(BuildContext context) {
    final Car car = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
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
                      AppBarWidget(
                        actions: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Config.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(Icons.bookmark_border, color: Colors.white, size: 23),
                          ),
                          SizedBox(width: 13),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.grey[300]!, width: 1),
                            ),
                            child: Icon(Icons.ios_share, color: Colors.black, size: 23),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CarNameWidget(car: car),
                      ),
                      Expanded(child: CarImagesWidget(images: car.images!, isExpanded: true)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            _buildPricePerPeriod("12", "14.0jt", true),
                            SizedBox(width: 16),
                            _buildPricePerPeriod("6", "12.0jt", false),
                            SizedBox(width: 16),
                            _buildPricePerPeriod("1", "15.0jt", false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SPECIFICATIONS", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[400])),
                      Container(
                        height: 80,
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildSpecificationCar("Color", "White"),
                            _buildSpecificationCar("Gearbox", "Automatic"),
                            _buildSpecificationCar("Seat", "4"),
                            _buildSpecificationCar("Motor", "v10 2.0"),
                            _buildSpecificationCar("Speed (0-100)", "3.2 sec"),
                            _buildSpecificationCar("Top Speed", "121 mph"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("12 Month", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text("IDR 4,35jt", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Text("per month", style: TextStyle(color: Colors.grey, fontSize: 15)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Select This Car", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
          SizedBox(height: 8),
          Text(data, style: TextStyle(color: Colors.black, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildPricePerPeriod(String month, String price, bool selected) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? Config.primaryColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: Colors.grey[300]!,
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$month Month", style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(price, style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
            Text("IDR", style: TextStyle(color: selected ? Colors.white : Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
