import 'package:car_rental/app/data/car_data.dart';
import 'package:car_rental/app/data/dealer_data.dart';
import 'package:car_rental/app/models/car_model.dart';
import 'package:car_rental/app/models/dealer_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Car> cars = <Car>[].obs;
  late Car displayCar;
  var dealers = <Dealer>[].obs;

  @override
  void onInit() {
    super.onInit();
    cars.value = CarData().getCarList();
    dealers.value = DealerData().getDealerList();
    displayCar = cars[2];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
