import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/model/destination_lodging_model.dart';
import 'package:tourease/controllers/favorite_controller.dart';
import 'package:tourease/controllers/cart_controller.dart';
import 'package:tourease/constants/colors.dart';
import 'package:tourease/routes/route.dart';

class DestinationLodgingCard extends StatelessWidget {
  final DestinationLodging destinationLodging;
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final CartController cartController = Get.put(CartController());

  DestinationLodgingCard({
    required this.destinationLodging,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Card(
            elevation: 0,
            color: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                    bottom: Radius.circular(10),
                  ),
                  child: Image.asset(
                    destinationLodging.imagePath,
                    width: double.infinity,
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Text(
                        destinationLodging.rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          destinationLodging.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
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
                  favoriteController.isFavoriteLodging(destinationLodging)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: favoriteController.isFavoriteLodging(destinationLodging)
                      ? Colors.red
                      : Colors.white,
                ),
                onPressed: () {
                  favoriteController.toggleFavoriteLodging(destinationLodging);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: ElevatedButton.icon(
              onPressed: () {
                cartController.addToLodgingCart(destinationLodging); // Add item to cart
                Get.snackbar(
                  'Added to Cart',
                  '${destinationLodging.title} added to cart!',
                  duration: Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 69),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: customPrimary,
              ),
              icon: Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.white),
              label: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
