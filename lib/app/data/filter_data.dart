import 'package:car_rental/app/models/filter.dart';

class FilterData {
  List<Filter> getFilterList() {
    return <Filter>[
      Filter("Highest Price"),
      Filter("Lowest Price"),
    ];
  }
}
