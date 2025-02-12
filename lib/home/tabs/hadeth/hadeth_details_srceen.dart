import 'package:flutter/material.dart';
import 'package:islami/models/hadeth_model.dart';

import '../../../app-colors.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        title: Text(
          args.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/sura_detials/sura_details_left.png",
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Text(
                  args.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColor.primaryColor),
                ),
              ),
              Image.asset(
                "assets/images/sura_detials/sura_details_right.png",
                fit: BoxFit.fill,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    args.content[index],
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                );
              },
              itemCount: args.content.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/sura_detials/sura_details_buttom.png",
                fit: BoxFit.cover,
              )
            ],
          )
        ],
      ),
    );
  }
}
