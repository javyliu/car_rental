import 'package:flutter/cupertino.dart';

class CarImagesWidget extends StatelessWidget {
  const CarImagesWidget({Key? key, required this.images, this.isExpanded = false}) : super(key: key);

  final List<String> images;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return PageView();
  }
}
