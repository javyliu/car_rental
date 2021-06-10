import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarImagesWidget extends StatelessWidget {
  const CarImagesWidget({Key? key, required this.images, this.isExpanded = false}) : super(key: key);

  final List<String> images;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return ValueBuilder<int?>(
      initialValue: 0,
      builder: (value, updateFn) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              child: PageView(
                physics: BouncingScrollPhysics(),
                onPageChanged: (value) {
                  print("----on page changed $value, $updateFn");
                  updateFn(value);
                },
                children: images
                    .map<Widget>(
                      (img) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Image.asset(img, fit: BoxFit.scaleDown),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images
                    .map(
                      (item) => AnimatedContainer(
                        duration: Duration(microseconds: 150),
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        height: 8,
                        width: images.indexOf(item) == value ? 20 : 8,
                        decoration: BoxDecoration(
                          color: images.indexOf(item) == value ? Colors.black : Colors.grey[400]!,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
      onUpdate: (value) => print('Value updated: $value'),
      onDispose: () => print('Widget unmounted'),
    );
  }
}
