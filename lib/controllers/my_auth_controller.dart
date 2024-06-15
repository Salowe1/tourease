import 'package:get/get.dart';

class MyAuthController extends GetxController {
  RxBool isLoggedIn = false.obs;

  void login() {
    // Implement your login logic here
    // For example, after successful login:
    isLoggedIn.value = true; // Set isLoggedIn to true
    // You can also store user session data or perform other tasks here
  }

  void logout() {
    // Implement your logout logic here
    // For example, on logout:
    isLoggedIn.value = false; // Set isLoggedIn to false
    // You may want to clear user session data or perform other cleanup tasks
  }
}
