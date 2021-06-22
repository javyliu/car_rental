import 'package:car_rental/app/models/car_model.dart';
import 'package:flutter/material.dart';

class CarNameWidget extends StatelessWidget {
  const CarNameWidget({Key? key, required this.car}) : super(key: key);
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(car.model!, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, height: 1)),
        SizedBox(height: 8),
        Text(car.brand!, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
