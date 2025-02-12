import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/models/sura_model.dart';

class SuraListWidget extends StatelessWidget {
  SuraModel suraModel;
  int index;

  SuraListWidget({
    required this.suraModel,
    required this.index,
  });

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
            Text("${index + 1}",
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(SuraModel.suraEnglishList[index],
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(" ${SuraModel.numOfVersesList[index]} Verses",
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
          SuraModel.suraArabicList[index],
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
