import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/my_auth_controller.dart'; // Adjust path as per your project structure

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyAuthController authController = Get.find(); // Retrieve MyAuthController instance

    return Scaffold(
      appBar: AppBar(
        title: Text('My Widget'),
      ),
      body: Center(
        child: Obx(() => Text(
          authController.isLoggedIn.value ? 'User is logged in' : 'User is logged out',
          style: TextStyle(fontSize: 20),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (authController.isLoggedIn.value) {
            authController.logout(); // Example of logging out
          } else {
            authController.login(); // Example of logging in
          }
        },
        child: Icon(Icons.login),
      ),
    );
  }
}
