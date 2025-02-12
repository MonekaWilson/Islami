import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/sura_model.dart';

import '../../../app-colors.dart';
import 'item_sura_content.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.fileName);
    }
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        title: Text(
          args.suraEnglishName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/sura_detials/sura_details_left.png",
                  fit: BoxFit.fill,
                ),
                Text(
                  args.suraArabicName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColor.primaryColor),
                ),
                Image.asset(
                  "assets/images/sura_detials/sura_details_right.png",
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ))
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemSuraContect(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
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

  void loadFile(String fileName) async {
    String content = await rootBundle.loadString("assets/files/$fileName");
    List<String> lines = content.trim().split("\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraArName;
  String suraEnName;
  int index;

  SuraDetailsArgs(
      {required this.index,
      required this.suraArName,
      required this.suraEnName});
}
