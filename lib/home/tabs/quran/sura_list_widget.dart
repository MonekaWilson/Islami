import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';

class SuraListWidget extends StatelessWidget {
  String suraEnName;
  String suraArName;
  String ayaNumber;
  int index;

  SuraListWidget(
      {required this.ayaNumber,
      required this.suraArName,
      required this.suraEnName,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/sora_number.png",
              color: AppColor.white,
              fit: BoxFit.cover,
            ),
            Text("$index", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraEnName,
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$ayaNumber Verses",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColor.white)),
                ],
              ),
            ],
          ),
        ),
        Text(
          suraArName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
