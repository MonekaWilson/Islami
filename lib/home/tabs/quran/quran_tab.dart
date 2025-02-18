import 'package:flutter/material.dart';
import 'package:islami/app-colors.dart';
import 'package:islami/home/tabs/quran/sura_details_screen.dart';
import 'package:islami/home/tabs/quran/sura_list_widget.dart';
import 'package:islami/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filterList = [];
  String searchText = "";
  Map<String, String> loadSuraList = {};

  @override
  void initState() {
    super.initState();
    addSuraList();
    filterList = List.from(SuraModel.suraList);
    loadLastSura();
  }

  void addSuraList() {
    if (SuraModel.suraList.isEmpty) {
      for (int i = 0; i < 114; i++) {
        SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishList[i],
          suraArabicName: SuraModel.suraArabicList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          fileName: "${i + 1}.txt",
        ));
      }
    }
    filterList = List.from(SuraModel.suraList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/quran_logo.png", fit: BoxFit.cover),
              TextField(
                cursorColor: AppColor.white,
                style: const TextStyle(color: AppColor.white),
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
                        color: AppColor.primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColor.primaryColor, width: 2),
                  ),
                ),
                onChanged: (text) {
                  setState(() {
                    searchText = text;
                    filterList = SuraModel.suraList.where((sura) {
                      return sura.suraEnglishName
                          .toLowerCase()
                          .contains(searchText.toLowerCase());
                    }).toList();
                  });
                },
              ),
              const SizedBox(height: 10),
              searchText.isNotEmpty || loadSuraList["suraEngName"] == ""
                  ? const SizedBox()
                  : buildMostRecentlyWidget(context),
              const SizedBox(height: 10),
              Text("Sura List", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  key: ValueKey(searchText),
                  separatorBuilder: (_, __) => const Divider(
                    color: AppColor.white,
                    thickness: 2,
                    indent: 30,
                    endIndent: 20,
                  ),
                  itemCount: filterList.length,
                  itemBuilder: (context, index) {
                    final sura = filterList[index];
                    return InkWell(
                      onTap: () {
                        final selectedSura = filterList[index];
                        saveLastSura(
                          suraEngName: selectedSura.suraEnglishName,
                          suraArbName: selectedSura.suraArabicName,
                          numOfVerses: selectedSura.numOfVerses,
                        );

                        Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: selectedSura,
                        );
                      },
                      child: SuraListWidget(
                        suraModel: sura,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMostRecentlyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently", style: Theme.of(context).textTheme.titleLarge),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 130,
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
                  Text(loadSuraList["suraEngName"] ?? "",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(loadSuraList["suraArbName"] ?? "",
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(loadSuraList["numOfVerses"] ?? "",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Image.asset("assets/images/sora_most_recent.png",
                  fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> saveLastSura(
      {required String suraEngName,
      required String suraArbName,
      required String numOfVerses}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("suraEngName", suraEngName);
    await prefs.setString("suraArbName", suraArbName);
    await prefs.setString("numOfVerses", numOfVerses);
    await loadLastSura();
  }

  Future<void> loadLastSura() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      loadSuraList = {
        "suraEngName": prefs.getString("suraEngName") ?? "",
        "suraArbName": prefs.getString("suraArbName") ?? "",
        "numOfVerses": prefs.getString("numOfVerses") ?? "",
      };
    });
  }
}
