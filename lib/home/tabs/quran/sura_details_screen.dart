import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        title: Text(
          args.suraEnName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/sura_detials/sura_details_left.png",
                  fit: BoxFit.fill,
                ),
                Text(
                  args.suraArName,
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
      ),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
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
