import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourease/routes/app_route.dart';
import 'package:tourease/screens/splash/onboarding_screen.dart';
import 'package:tourease/screens/home/home.dart';
import 'package:tourease/services/locale_service.dart';
import 'package:tourease/controllers/my_auth_controller.dart'; // Ensure correct import path

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage for persistent storage
  await GetStorage.init();

  // Initialize SharedPreferences if needed
  // final prefs = await SharedPreferences.getInstance();

  // Initialize GetX and LocaleService
  await Get.putAsync(() => Future.delayed(Duration(milliseconds: 100), () => LocaleService())); // Delayed initialization example
  Get.put(MyAuthController()); // Initialize MyAuthController

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      home: FutureBuilder<bool>(
        // Example future to check onboarding status
        future: _checkOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen(); // Show a splash screen while waiting
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomePage();
          } else {
            return OnboardingScreen();
          }
        },
      ),
      getPages: Routes.routes.map((route) {
        return GetPage(
          name: route.name,
          page: route.page,
          transition: Transition.native,
        );
      }).toList(),
    );
  }

  Future<bool> _checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingComplete') ?? false;
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to your preference
      body: Center(
        child: CircularProgressIndicator(), // You can customize this widget as needed
      ),
    );
  }
}
