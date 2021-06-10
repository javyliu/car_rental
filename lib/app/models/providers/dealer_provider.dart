import 'package:get/get.dart';

import '../dealer_model.dart';

class DealerProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Dealer.fromJson(map);
      if (map is List) return map.map((item) => Dealer.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Dealer?> getDealer(int id) async {
    final response = await get('dealer/$id');
    return response.body;
  }

  Future<Response<Dealer>> postDealer(Dealer dealer) async =>
      await post('dealer', dealer);
  Future<Response> deleteDealer(int id) async => await delete('dealer/$id');
}
