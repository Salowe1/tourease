import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/route.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double amount = Get.arguments ?? 0.0; // Fetch amount passed from previous screen

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Amount to Pay:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              '${amount.toStringAsFixed(2)} FCFA', // Format amount with currency symbol
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simulate payment processing (replace with actual payment gateway integration)
                Future.delayed(Duration(seconds: 2), () {
                  // Navigate back to home after payment success
                  Get.offAllNamed(MyRoutes.home);
                  // Show success notification
                  Get.snackbar(
                    'Payment Successful',
                    'Your payment of ${amount.toStringAsFixed(2)} FCFA was successful.',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                });
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
