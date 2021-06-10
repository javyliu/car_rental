import 'package:car_rental/app/models/dealer_model.dart';

class DealerData {
  List<Dealer> getDealerList() {
    return <Dealer>[
      Dealer(
        "Hertz",
        174,
        "assets/images/dealers/hertz.png",
      ),
      Dealer(
        "Avis",
        126,
        "assets/images/dealers/avis.png",
      ),
      Dealer(
        "Tesla",
        89,
        "assets/images/dealers/tesla.jpg",
      ),
    ];
  }
}
