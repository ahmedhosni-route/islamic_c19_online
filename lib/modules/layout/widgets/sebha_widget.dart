import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SebhaWidget extends StatelessWidget {
  const SebhaWidget({
    super.key,
    required this.zikr,
    required this.counter,
    required this.beadsCount,
    required this.turns,
    required this.onTap,
  });

  final String zikr;
  final int counter;
  final int beadsCount;
  final double turns;
  final VoidCallback onTap;

  final double ringSize = 378;
  final double beadSize = 36;
  final double headHeight = 79;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: ringSize,
          height: headHeight + ringSize,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: ringSize / 2 - 9,
                child: Image.asset("assets/images/sebha_head.png", width: 74),
              ),
              Positioned.fill(
                top: headHeight,
                child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: Stack(
                    alignment: Alignment.center,
                    children: List.generate(beadsCount, (index) {
                      return getBead(index);
                    }),
                  ),
                ),
              ),
              Positioned.fill(
                top: headHeight + 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      zikr,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      counter.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBead(int index) {

    double angle = 2 * pi * index / beadsCount - pi / 2;
    double radius = (ringSize - beadSize) / 2;
    return Transform.translate(
      offset: Offset(radius * cos(angle), radius * sin(angle)),
      child: Container(
        width: beadSize,
        height: beadSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color(0xffFBCC7A),
              Color(0xffE5B666),
              Color(0xffC99C4B),
              Color(0xffB1853C),
              Color(0xff876937),
            ],
            stops: [0, 0.3, 0.6, 0.8, 1],
          ),
        ),
      ),
    );
  }
}
