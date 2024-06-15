import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/cart_controller.dart';
import 'package:tourease/model/destination_model.dart';
import 'package:tourease/model/destination_lodging_model.dart';

class AddedToCartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        final cartItems = cartController.cartItems;
        final lodgingCartItems = cartController.lodgingCartItems;

        // Combine both cartItems and lodgingCartItems
        final allCartItems = [...cartItems, ...lodgingCartItems];

        // Calculate subtotal
        final double subtotal = allCartItems.fold(0, (sum, item) {
          if (item is Destination) {
            return sum + item.price;
          } else if (item is DestinationLodging) {
            return sum + item.price;
          }
          return sum;
        });

        final double gst = 200;
        final double deliveryFee = 300;
        final double grandTotal = subtotal + gst + deliveryFee;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: allCartItems.length,
                  itemBuilder: (context, index) {
                    final item = allCartItems[index];
                    return buildCartItem(item);
                  },
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order summary',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Subtotal: ₹$subtotal',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'GST: ₹$gst',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Delivery partner fee for 8km: ₹$deliveryFee',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Divider(color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Grand Total: ₹$grandTotal',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add order functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Button color
                        ),
                        child: Text('ORDER NOW', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildCartItem(dynamic item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              
              SizedBox(height: 8),
              Row(
                children: [
                  // Image placeholder
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: ₹${item.price}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      if (item is Destination) {
                        cartController.removeFromCart(item);
                      } else if (item is DestinationLodging) {
                        cartController.removeFromLodgingCart(item);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
