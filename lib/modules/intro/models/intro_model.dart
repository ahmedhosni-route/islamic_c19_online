class IntroModel {
  final String image;
  final String title;
  final String? subTitle;

  const IntroModel({
    required this.image,
    required this.title,
    this.subTitle,
  });
}

const List<IntroModel> introItems = [
  IntroModel(
    image: 'assets/images/intro/welcome_calligraphy.png',
    title: 'Welcome To Islmi App',
  ),
  IntroModel(
    image: 'assets/images/intro/welcome_mosque.png',
    title: 'Welcome To Islami',
    subTitle: 'We Are Very Excited To Have You In Our Community',
  ),
  IntroModel(
    image: 'assets/images/intro/reading_quran.png',
    title: 'Reading the Quran',
    subTitle: 'Read, and your Lord is the Most Generous',
  ),
  IntroModel(
    image: 'assets/images/intro/bearish_hands.png',
    title: 'Bearish',
    subTitle: 'Praise the name of your Lord, the Most High',
  ),
  IntroModel(
    image: 'assets/images/intro/quran_radio.png',
    title: 'Holy Quran Radio',
    subTitle:
    'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];