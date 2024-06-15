import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/destination_model.dart';
import 'package:tourease/controllers/favorite_controller.dart';
import 'package:tourease/controllers/cart_controller.dart'; // Import CartController
import 'package:url_launcher/url_launcher.dart';
import 'package:tourease/constants/colors.dart';
import 'package:tourease/routes/route.dart';
import 'package:tourease/routes/app_route.dart';


class DestinationCard extends StatelessWidget {
  final Destination destination;
  final FavoriteController favoriteController = Get.put(FavoriteController());

  DestinationCard({
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to destination details screen
        Get.toNamed(MyRoutes.destinationDetails, arguments: destination);
      },
      child: Container(
        width: 250,
        margin: EdgeInsets.only(right: 26),
        child: Stack(
          children: [
            Card(
              elevation: 5,
              color: Colors.white,
              shadowColor: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      destination.imagePath,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              destination.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              destination.rating.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () async {
                            late String url;
                            // Handle different URLs based on destination title
                            if (destination.title == 'Niladri Reservoir') {
                              url = 'https://maps.app.goo.gl/7LPtULbi69epb4tNA';
                            } else if (destination.title == 'Darma Valley') {
                              url = 'https://maps.app.goo.gl/ZtNxDkNCE86mQDqk6';
                            } else {
                              return;
                            }

                            try {
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            } catch (e) {
                              print('Error launching URL: $e');
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                destination.location,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
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
            Positioned(
              top: 8,
              right: 8,
              child: Obx(
                () => IconButton(
                  icon: Icon(
                    favoriteController.isFavorite(destination)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoriteController.isFavorite(destination)
                        ? Colors.red
                        : Colors.white,
                  ),
                  onPressed: () {
                    favoriteController.toggleFavorite(destination);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(destination); // Add item to cart
                  Get.snackbar(
                    'Added to Cart',
                    '${destination.title} added to cart!',
                    duration: Duration(seconds: 2),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: customPrimary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}