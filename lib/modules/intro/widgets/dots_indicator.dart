import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const DotsIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 8,
          width: isActive ? 22 : 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.gold : Colors.white24,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}