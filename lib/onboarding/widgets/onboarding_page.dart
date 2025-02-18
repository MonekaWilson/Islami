import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/models/on_boarding_data.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingData onBoardingData;

  const OnBoardingPage({required this.onBoardingData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(onBoardingData.imagePath)),
          SizedBox(
            height: 24,
          ),
          Text(
            onBoardingData.title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
          SizedBox(
            height: 24,
          ),
          if (onBoardingData.desc != null)
            Text(
              onBoardingData.desc!,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
