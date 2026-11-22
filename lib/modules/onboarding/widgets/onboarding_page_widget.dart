import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Image.asset(onboardingModel.image, height: 400),
              ),
            ),
          ),
          Text(
            onboardingModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          if (onboardingModel.description != null) ...[
            SizedBox(height: 32),
            Text(
              onboardingModel.description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.gold,
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.8,
              ),
            ),
          ] else
            SizedBox(height: 40),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

class OnboardingModel {
  String image;
  String title;
  String? description;

  OnboardingModel({
    required this.image,
    required this.title,
    this.description,
  });
}
