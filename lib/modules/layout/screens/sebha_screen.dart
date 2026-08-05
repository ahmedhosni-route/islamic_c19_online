import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName = 'sebha';

  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int _counter = 0;
  double _turns = 0.0;
  int _dhikrIndex = 0;

  final List<String> _azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
  ];

  void _onSebhaTap() {
    setState(() {
      _counter++;
      _turns += 0.03;

      if (_counter == 32) {
        _counter = 0;
        _dhikrIndex = (_dhikrIndex + 1) % _azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryGold = Color(0xFFE2BE7F);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sebha_bg (1).png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // تدرج غامق من فوق لتحت
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black45.withValues(alpha: 0.65),
                    Colors.black45.withValues(alpha: 0.95),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Islami Logo
                  Image.asset(
                    'assets/images/islami_logo.png',
                    height: 171,
                    errorBuilder: (_, __, ___) => const Text(
                      'Islami',
                      style: TextStyle(
                        color: primaryGold,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Header Title
                  const Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  // Sebha Interactive Ring
                  GestureDetector(
                    onTap: _onSebhaTap,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: _turns,
                          duration: const Duration(milliseconds: 200),
                          child: Image.asset(
                            'assets/images/sebha_bg.png',
                            width: 280,
                            height: 280,
                            errorBuilder: (_, __, ___) => Container(
                              width: 260,
                              height: 260,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primaryGold, width: 6),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _azkar[_dhikrIndex],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '$_counter',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}