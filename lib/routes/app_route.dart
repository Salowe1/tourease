import 'package:get/get.dart';
import 'package:tourease/screens/splash/onboarding_screen.dart';
import 'package:tourease/screens/home/home.dart';
import 'package:tourease/screens/lodging/lodging_home.dart';
import 'package:tourease/screens/search/search.dart';
import 'package:tourease/screens/food/food_home.dart';
import 'package:tourease/screens/profile/profile.dart';
import 'package:tourease/screens/lodging/details/destination_details_lodging.dart';
import 'package:tourease/screens/home/details/destination_details.dart';
import 'package:tourease/screens/profile/favorite.dart';
import 'package:tourease/screens/cart/added_to_cart.dart';
import 'package:tourease/screens/lodging/components/view_all_destinations_lodging.dart';
import 'package:tourease/screens/home/components/view_all_destinations.dart';
import 'package:tourease/services/language_page.dart';
import 'package:tourease/services/locale_service.dart';
import 'package:tourease/routes/route.dart';
import 'package:tourease/screens/auth/signin_page.dart';
import 'package:tourease/screens/auth/signup_page.dart';
import 'package:tourease/screens/profile/terms_and_policies.dart'; // Import terms_and_policies.dart
import 'package:tourease/screens/profile/faq_page.dart'; // Import faq_page.dart
import 'package:tourease/screens/payment/validate_payment.dart'; // Import payment_page.dart

class Routes {
  static final routes = [
    GetPage(name: MyRoutes.splash, page: () => OnboardingScreen()),
    GetPage(name: MyRoutes.home, page: () => HomePage()),
    GetPage(name: MyRoutes.lodging, page: () => LodgingPage()),
    GetPage(name: MyRoutes.search, page: () => SearchPage()),
    GetPage(name: MyRoutes.food, page: () => FoodPage()),
    GetPage(name: MyRoutes.profile, page: () => ProfilePage()),
    GetPage(name: MyRoutes.destinationDetails, page: () => DestinationDetails()),
    GetPage(name: MyRoutes.favorite, page: () => FavoritePage()),
    GetPage(name: MyRoutes.addedToCart, page: () => AddedToCartPage()),
    GetPage(name: MyRoutes.viewAllDestinations, page: () => ViewAllDestinationsPage()),
    GetPage(name: MyRoutes.signin, page: () => SignInPage()),
    GetPage(name: MyRoutes.signup, page: () => SignUpPage()),
    GetPage(name: MyRoutes.language, page: () => LanguagePage()),
    GetPage(name: MyRoutes.termsAndPolicies, page: () => TermsAndPoliciesPage()), // Route for terms and policies page
    GetPage(name: MyRoutes.payment, page: () => PaymentPage()), // Route for payment page

    GetPage(name: MyRoutes.destinationLodgingDetails, page: () => DestinationDetailsLodging()),
    GetPage(name: MyRoutes.viewAllDestinationsLodging, page: () => ViewAllDestinationsLodgingPage()),
    GetPage(name: MyRoutes.faq, page: () => FAQPage()),

  ];
}
