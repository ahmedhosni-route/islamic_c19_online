import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/noraheb_bekom.png",
      "title": "Welcome To Islmi App",
      "subtitle": "",
    },
    {
      "image": "assets/images/masged.png",
      "title": "Welcome To Islami",
      "subtitle": "We Are Very Excited To Have You In Our Community",
    },
    {
      "image": "assets/images/moshaf.png",
      "title": "Reading the Quran",
      "subtitle": "Read, and your Lord is the Most Generous",
    },
    {
      "image": "assets/images/doaa.png",
      "title": "Bearish",
      "subtitle": "Praise the name of your Lord, the Most High",
    },
    {
      "image": "assets/images/mic.png",
      "title": "Holy Quran Radio",
      "subtitle":
          "You can listen to the Holy Quran Radio through the application for free and easily",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/quran_header.png',
                height: 151,
                width: 291,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    final item = _onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Image.asset(
                              item["image"]!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 41),
                        Text(
                          item["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Janna LT",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 41),

                        SizedBox(
                          height: 70,
                          child: Text(
                            item["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "Janna LT",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: _currentPage > 0 ? 1.0 : 0.0,
                    child: IgnorePointer(
                      ignoring: _currentPage == 0,
                      child: TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                            fontFamily: "Janna LT",
                            fontSize: 16,
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_onboardingData.length, (index) {
                      final isSelected = _currentPage == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isSelected ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isSelected
                              ? AppColors.gold
                              : const Color(0xff707070),
                        ),
                      );
                    }),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage < _onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          LayoutScreen.routeName,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == _onboardingData.length - 1
                          ? "Finish"
                          : "Next",
                      style: const TextStyle(
                        fontFamily: "Janna LT",
                        fontSize: 16,
                        color: AppColors.gold,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
