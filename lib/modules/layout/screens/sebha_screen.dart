import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int azkarIndex = 0;
  double angle = 0;

  final List<String> azkar = ["سبحان الله", "الحمد لله", "الله أكبر"];

  void onSebhaTap() {
    setState(() {
      counter++;
      angle += (2 * 3.14) / 33;
      if (counter == 33) {
        counter = 0;
        azkarIndex = (azkarIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_sebha.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/quran_header.png',
                height: 171,
                width: 291,
              ),
              const SizedBox(height: 25),
              const Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
                style: TextStyle(
                  fontFamily: "Janna LT",
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: onSebhaTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(24, 0),
                      child: Image.asset(
                        'assets/images/sebha_head.png',
                        height: 86,
                        width: 73,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: angle,
                            child: Image.asset(
                              'assets/images/sebha_body.png',
                              width: 379,
                              height: 381,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                azkar[azkarIndex],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: "Janna LT",
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '$counter',
                                style: const TextStyle(
                                  fontFamily: "Janna LT",
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
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
}
