import 'package:car_rental/app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config.dart';
import '../controllers/book_car_controller.dart';

class BookCarView extends GetView<BookCarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      AppBarWidget(
                        actions: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Config.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(Icons.bookmark_border, color: Colors.white, size: 23),
                          ),
                          SizedBox(width: 13),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.grey[300]!, width: 1),
                            ),
                            child: Icon(Icons.ios_share, color: Colors.black, size: 23),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text("hello world")
            ],
          ),
        ),
      ),
    );
  }
}
