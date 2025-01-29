import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';

class ItemSuraContect extends StatelessWidget {
  String content;
  int index;

  ItemSuraContect({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 2,
          )),
      margin: EdgeInsets.all(12),
      child: Text(
        "$content [${index + 1}]",
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
