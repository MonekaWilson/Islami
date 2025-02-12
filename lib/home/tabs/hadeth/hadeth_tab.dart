import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/home/tabs/hadeth/hadeth_details_srceen.dart';

import '../../../models/hadeth_model.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/quran_logo.png"),
            CarouselSlider.builder(
              itemCount: hadethList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: hadethList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColor.black,
                        ),
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/hadeth_tab/hadeth_tab_lft.png",
                                fit: BoxFit.cover,
                              ),
                              Text(
                                hadethList[itemIndex].title,
                                style: TextStyle(
                                  color: AppColor.black,
                                ),
                              ),
                              Image.asset(
                                "assets/images/hadeth_tab/hadeth_tab_rth.png",
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  HadethDetailsScreen.routeName,
                                  arguments: hadethList[itemIndex],
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/hadeth_tab/hadeth_tab_bg.png"),
                                  ),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    hadethList[itemIndex].content.join(""),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 12,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     //Image.asset("assets/images/hadeth_tab/hadeth_tab_buttom.png",fit: BoxFit.cover),
                          //   ],
                          // ),
                        ],
                      ),
              ),
              options: CarouselOptions(
                height: 425,
                viewportFraction: 0.75,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString("assets/files/h$i.txt");
      List<String> hadethLines = hadethContent.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
