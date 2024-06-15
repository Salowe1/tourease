import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/destination_lodging_model.dart';
import 'full_screen_image.dart'; // Import the new screen
import 'package:tourease/constants/colors.dart';
import 'package:tourease/routes/route.dart'; // Import your routes
import 'package:tourease/screens/payment/validate_payment.dart'; // Import the payment page
import 'package:tourease/controllers/my_auth_controller.dart';

class DestinationDetailsLodging extends StatelessWidget {
  final DestinationLodging destinationLodging = Get.arguments;

  void _navigateToPayment() {
    Get.toNamed(MyRoutes.payment, arguments: destinationLodging.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              
            },
            child: Image.asset(
              destinationLodging.imagePath,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationLodging.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(destinationLodging.location, style: TextStyle(color: Colors.grey)),
                      Spacer(),
                      Text(
                        '${destinationLodging.price.toStringAsFixed(2)} FCFA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: customPrimary,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 40),
                  
                  Text(
                    'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC...',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () {
                      // Check if user is authenticated (example)
                      if (Get.find<MyAuthController>().isLoggedIn.value) {
                        _navigateToPayment();
                      } else {
                        Get.toNamed(MyRoutes.signin);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 127.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: customPrimary,
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
