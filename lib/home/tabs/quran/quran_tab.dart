import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/home/tabs/quran/sura_list_widget.dart';
import 'package:islami/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishList[i],
          suraArabicName: SuraModel.suraArabicList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          fileName: "${i + 1}.txt"));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
  }

  List<SuraModel> filterList = SuraModel.suraList;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/quran_logo.png",
                fit: BoxFit.cover,
              ),
              TextField(
                cursorColor: AppColor.white,
                style: const TextStyle(
                  color: AppColor.white,
                ),
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: Theme.of(context).textTheme.titleLarge,
                  prefixIcon: const ImageIcon(
                    AssetImage("assets/images/quran_icon.png"),
                    color: AppColor.primaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColor.primaryColor,
                        width: 2,
                      )),
                ),
                onChanged: (text) {
                  searchText = text;
                  filterList = SuraModel.suraList.where((suraModel) {
                    return suraModel.suraArabicName.contains(searchText) ||
                        suraModel.suraEnglishName
                            .toLowerCase()
                            .contains(searchText.toLowerCase());
                  }).toList();
                  setState(() {});
                  print(filterList);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Most Recently",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sura En",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Sura Ar",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Sura Num",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/sora_most_recent.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sura List",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColor.white,
                      thickness: 2,
                      indent: 30,
                      endIndent: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            SuraDetailsScreen.routeName,
                            arguments: filterList[index]);
                      },
                      child: SuraListWidget(
                        suraModel: filterList[index],
                        index: index,
                      ),
                    );
                  },
                  itemCount: filterList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
