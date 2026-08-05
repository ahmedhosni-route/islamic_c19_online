import 'package:flutter/material.dart';

import '../../layout/screens/layout_screen.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      imagePath: 'assets/images/welcome_img.png',
      title: 'Welcome To Islami App',
      description: '',
    ),
    OnboardingModel(
      imagePath: 'assets/images/mosque_img.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      imagePath: 'assets/images/quran_img.png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      imagePath: 'assets/images/sebha_intro_img.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      imagePath: 'assets/images/radio_intro_img.png',
      title: 'Holy Quran Radio',
      description: 'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const primaryGold = Color(0xFFE2BE7F);
    const darkBackground = Color(0xFF202020);

    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header Logo
            Image.asset(
              'assets/images/islami_logo.png',
              height: 171,
              errorBuilder: (_, __, ___) => const Text(
                'Islami',
                style: TextStyle(
                  color: primaryGold,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Slider Pages
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.image,
                              size: 120,
                              color: primaryGold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: primaryGold,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (item.description.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: primaryGold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Navigation Bar (Back - Dots - Next/Finish)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  TextButton(
                    onPressed: _currentIndex > 0
                        ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                        : null,
                    child: Text(
                      _currentIndex > 0 ? 'Back' : '',
                      style: const TextStyle(color: primaryGold, fontSize: 16),
                    ),
                  ),

                  // Dots Indicator
                  Row(
                    children: List.generate(
                      _pages.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index ? primaryGold : Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next / Finish Button
                  TextButton(
                    onPressed: () {
                      if (_currentIndex < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, LayoutScreen.routeName);
                      }
                    },
                    child: Text(
                      _currentIndex == _pages.length - 1 ? 'Finish' : 'Next',
                      style: const TextStyle(
                        color: primaryGold,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}