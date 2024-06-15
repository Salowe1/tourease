import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/controllers/favorite_controller.dart';
import 'package:tourease/screens/home/components/destination_card.dart';
import 'package:tourease/model/destination_model.dart';

class FavoritePage extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 242, 242, 242),
        title: Text('Favorites'),
      ),
      body: Obx(
        () => favoriteController.favoriteDestinations.isEmpty
            ? Center(
                child: Text('No favorites added yet.'),
              )
            : ListView.builder(
                itemCount: favoriteController.favoriteDestinations.length,
                itemBuilder: (context, index) {
                  return DestinationCard(
                    destination: favoriteController.favoriteDestinations[index],
                  );
                },
              ),
      ),
    );
  }
}
