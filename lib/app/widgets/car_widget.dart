import 'package:car_rental/app/models/car_model.dart';
import 'package:flutter/material.dart';

import '../config.dart';

Widget buildCar(Car car, [int? idx]) {
  // print("-----${car.brand}");

  return Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(right: idx != null ? 16 : 0, left: idx == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: Config.primaryColorShadow,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition!,
                style: TextStyle(color: Config.primaryColor, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 115,
          child: Center(
            child: Hero(
              tag: car.model!,
              child: Image.asset(car.images!.first, fit: BoxFit.fitWidth),
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(car.model!, style: TextStyle(fontSize: 18)),
        SizedBox(height: 8),
        Text(car.brand!,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1,
            )),
        Text(
          """per ${car.condition == 'Daily' ? 'day' : car.condition == 'Weekly' ? 'week' : 'month'}""",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        )
      ],
    ),
  );
}
