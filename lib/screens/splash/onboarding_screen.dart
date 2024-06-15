import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:tourease/routes/route.dart'; // Ensure this path is correct
import 'package:tourease/constants/colors.dart';


class OnboardingScreen extends StatelessWidget {
  Future<void> _onIntroEnd(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Get.offNamed(MyRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Column(
            children: [
              Text(
                'Life is short and the world is',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: customPrimary,
                ),
              ),
              Text(
                'wide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: customPrimary,
                ),
              ),
            ],
          ),
          body: 'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world',
          image: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Image.asset(
              'assets/image/Onboard-1.jpeg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            bodyTextStyle: TextStyle(fontSize: 16, color: Color.fromARGB(255, 111, 106, 106)),
          ),
        ),
        PageViewModel(
          title: 'Welcome to Onboarding Screen ',
          body: 'This is the second screen of the onboarding process. Customize your content here.',
          image: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Image.asset(
              'assets/image/Onboard-2.jpeg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: customPrimary),
            bodyTextStyle: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 111, 106, 106)),
          ),
        ),
        PageViewModel(
          title: 'Welcome to Onboarding Screen ',
          body: 'This is the final screen of the onboarding process. Customize your content here.',
          image: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            child: Image.asset(
              'assets/image/Onboard-3.jpeg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: customPrimary ),
            bodyTextStyle: TextStyle(fontSize: 16, color: Color.fromARGB(255, 111, 106, 106)),
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(color: customPrimary)),
      next: const Icon(Icons.arrow_forward, color: customPrimary),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600, color: customPrimary)),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: customPrimary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
