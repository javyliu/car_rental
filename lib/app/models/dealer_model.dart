class Dealer {
  String? name;
  int? offers;
  String? image;

  Dealer(this.name, this.offers, this.image);

  Dealer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offers = json['offers'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['offers'] = offers;
    data['image'] = image;
    return data;
  }
}
