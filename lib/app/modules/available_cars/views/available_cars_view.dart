import 'package:car_rental/app/config.dart';
import 'package:car_rental/app/data/car_data.dart';
import 'package:car_rental/app/data/filter_data.dart';
import 'package:car_rental/app/models/filter.dart';
import 'package:car_rental/app/routes/app_pages.dart';
import 'package:car_rental/app/widgets/app_bar_widget.dart';
import 'package:car_rental/app/widgets/car_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/available_cars_controller.dart';

class AvailableCarsView extends GetView<AvailableCarsController> {
  @override
  Widget build(BuildContext context) {
    final filter = FilterData().getFilterList();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              AppBarWidget(
                title: "Available Car (${CarData().getCarList().length.toString()})",
              ),
              SizedBox(height: 18),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    children: CarData()
                        .getCarList()
                        .map((item) => GestureDetector(
                              onTap: () => Get.toNamed(Routes.BOOK_CAR, arguments: item),
                              child: buildCar(item),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(left: 14),
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Config.primaryColor, borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Icon(LineIcons.filter, color: Colors.white, size: 24),
            ),
            ValueBuilder<Filter?>(
              initialValue: filter[0],
              builder: (value, updateFn) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: filter
                    .map(
                      (e) => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.name,
                            style: TextStyle(
                              color: e.name == value?.name ? Config.primaryColor : Colors.grey[500],
                              fontWeight: value?.name == e.name ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                        onTap: () {
                          updateFn(e);
                        },
                      ),
                    )
                    .toList(),
              ),
              // if you need to call something outside the builder method.
              onUpdate: (value) => print('Value updated: value'),
              onDispose: () => print('Widget unmounted'),
            ),
          ],
        ),
      ),
    );
  }
}
