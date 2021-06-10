class Car {
  String? brand;
  String? model;
  double? price;
  String? condition;
  List<String>? images;

  Car(this.brand, this.model, this.price, this.condition, this.images);

  Car.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    model = json['model'];
    price = json['price'];
    condition = json['condition'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand'] = brand;
    data['model'] = model;
    data['price'] = price;
    data['condition'] = condition;
    data['images'] = images;
    return data;
  }
}
