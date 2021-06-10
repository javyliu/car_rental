import 'package:get/get.dart';

import '../car_model.dart';

class CarProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Car.fromJson(map);
      if (map is List) return map.map((item) => Car.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Car?> getCar(int id) async {
    final response = await get('car/$id');
    return response.body;
  }

  Future<Response<Car>> postCar(Car car) async => await post('car', car);
  Future<Response> deleteCar(int id) async => await delete('car/$id');
}
