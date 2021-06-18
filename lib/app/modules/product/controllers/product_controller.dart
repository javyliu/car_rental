import 'package:car_rental/app/data/car_data.dart';
import 'package:car_rental/app/data/dealer_data.dart';
import 'package:car_rental/app/models/car_model.dart';
import 'package:car_rental/app/models/dealer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Car> cars = <Car>[];
  late Car displayCar;
  var dealers = <Dealer>[];
  late ScrollController sc;

  @override
  void onInit() {
    print("------product init");
    sc = ScrollController();
    cars = CarData().getCarList();
    dealers = DealerData().getDealerList();
    displayCar = cars[2];
    super.onInit();
  }

  @override
  void onReady() {
    print("-----product on ready");

    super.onReady();
  }

  @override
  void onClose() {
    sc.dispose();
    print("---------product controller closed");
  }
}
