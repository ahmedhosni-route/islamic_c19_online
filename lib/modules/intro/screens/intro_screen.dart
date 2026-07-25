import 'package:flutter/material.dart';
import 'package:islamic_c19_online/core/theme/app_colors.dart';
import 'package:islamic_c19_online/modules/layout/screens/layout_screen.dart';
import '../models/intro_model.dart';
import '../widgets/dots_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'IntroScreen';

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  void _goNext() {
    if (_currentIndex == introItems.length - 1) {
      Navigator.of(context).pushReplacementNamed(LayoutScreen.routeName);
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goBack() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLast = _currentIndex == introItems.length - 1;
    final bool isFirst = _currentIndex == 0;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: _Logo(),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: introItems.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) {
                  final item = introItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item.image,
                          height: 320,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.gold,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (item.subTitle != null) ...[
                          const SizedBox(height: 16),
                          Text(
                            item.subTitle!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.gold,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60,
                    child: isFirst
                        ? const SizedBox.shrink()
                        : TextButton(
                      onPressed: _goBack,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: AppColors.gold,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DotsIndicator(
                    count: introItems.length,
                    currentIndex: _currentIndex,
                  ),
                  SizedBox(
                    width: 60,
                    child: TextButton(
                      onPressed: _goNext,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerRight,
                      ),
                      child: Text(
                        isLast ? 'Finish' : 'Next',
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontWeight: FontWeight.bold,
                        ),
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
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/intro/logo_islami.png',
      height: 90,
    );
  }
}