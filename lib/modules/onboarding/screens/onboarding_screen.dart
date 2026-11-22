import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';

import '../widgets/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController pageController = PageController();
  List<OnboardingModel> pages = [
    OnboardingModel(
      image: "assets/images/onboarding_welcome.png",
      title: "Welcome To Islami App",
    ),
    OnboardingModel(
      image: "assets/images/onboarding_kabba.png",
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      image: "assets/images/onboarding_quran.png",
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      image: "assets/images/onboarding_bearish.png",
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      image: "assets/images/onboarding_radio.png",
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/quran_header.png", width: 295),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (value) {
                  currentPage = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(onboardingModel: pages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: currentPage == 0
                          ? SizedBox()
                          : getNavButton(
                              label: "Back",
                              onPressed: () {
                                pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                    ),
                  ),
                  Row(
                    children: List.generate(pages.length, (index) {
                      return getDot(index);
                    }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: currentPage == pages.length - 1
                          ? getNavButton(
                              label: "Finish",
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LayoutScreen.routeName,
                                  (route) => false,
                                );
                              },
                            )
                          : getNavButton(
                              label: "Next",
                              onPressed: () {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNavButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: AppColors.gold),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    );
  }

  Widget getDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: index == currentPage ? 20 : 7,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: index == currentPage
            ? AppColors.gold
            : AppColors.white.withValues(alpha: 0.4),
      ),
    );
  }
}
