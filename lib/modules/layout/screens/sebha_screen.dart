import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';

import '../widgets/sebha_widget.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int zikrIndex = 0;
  int beadsCount = 33;
  double turns = 0;
  List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_sebha.jpg"),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundColor.withValues(alpha: 0),
              AppColors.backgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            child: Column(
              children: [
                Image.asset("assets/images/quran_header.png", width: 295),
                SizedBox(height: 16),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                ),
                Expanded(
                  child: SebhaWidget(
                    zikr: azkar[zikrIndex],
                    counter: counter,
                    beadsCount: beadsCount,
                    turns: turns,
                    onTap: onSebhaTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSebhaTap() {

    if (counter == beadsCount) {
      counter = 0;
      zikrIndex = (zikrIndex + 1) % azkar.length;
    }
    counter++;
    turns += 1 / beadsCount;
    setState(() {});
  }
}
