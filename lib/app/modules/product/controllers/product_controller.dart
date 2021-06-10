import 'package:car_rental/app/data/car_data.dart';
import 'package:car_rental/app/data/dealer_data.dart';
import 'package:car_rental/app/models/car_model.dart';
import 'package:car_rental/app/models/dealer_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Car> cars = [];
  late Car displayCar;
  late List<Dealer> dealers = [];

  @override
  void onInit() {
    super.onInit();
    cars = CarData().getCarList();
    dealers = DealerData().getDealerList();
    displayCar = cars[2];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
