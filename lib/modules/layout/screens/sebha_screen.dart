import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        image: DecorationImage(
          image: AssetImage('assets/images/sebha/sebha_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double ringSize = constraints.maxWidth * 0.86;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/intro/logo_islami.png',
                    height: 110,
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/sebha/sebha_beads.png',
                        width: ringSize,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'سبحان الله',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '30',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: ringSize * 0.13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}