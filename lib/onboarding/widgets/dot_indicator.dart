import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
