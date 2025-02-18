import 'dart:math';

import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbehList = [
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
  ];
  int counter = 0;
  double turns = 0;
  late String tasbehTitle = tasbehList[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.asset("assets/images/quran_logo.png", fit: BoxFit.cover),
          const Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const Row(),
              Image.asset(
                "assets/images/sebha-head.png",
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.12,
                child: AnimatedRotation(
                  duration: Duration(milliseconds: 500),
                  turns: turns,
                  child: InkWell(
                    autofocus: false,
                    splashColor: Colors.transparent,
                    onTap: () {
                      _updateTasbeh();
                    },
                    child: Image.asset(
                      "assets/images/sebha-body.png",
                      width: double.infinity,
                      //fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                  Text(
                    tasbehTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    counter.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  void _updateTasbeh() {
    counter++;
    turns = turns + (pi / 80);
    if (counter > 33) {
      tasbehTitle = tasbehList[(tasbehList.indexOf(tasbehTitle) + 1) % 3];
      counter = 0;
    }
    setState(() {});
  }
}
