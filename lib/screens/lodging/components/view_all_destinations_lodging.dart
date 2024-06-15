import 'package:flutter/material.dart';
import 'package:tourease/screens/lodging/components/destination_lodging_card.dart';
import 'package:tourease/model/destination_lodging_model.dart';

class ViewAllDestinationsLodgingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of destinations
    List<DestinationLodging> destinationsList = [
      DestinationLodging(
        imagePath: 'assets/image/house.jpeg',
        title: 'Ruine de Lorépeni',
        location: 'location',
        rating: 4.7,
        price: 1000,
      ),
      DestinationLodging(
        imagePath: 'assets/image/house.jpeg',
        title: 'Hotel Laico',
        location: 'location',
        rating: 4.5,
        price: 2000,
      ),
      // Add
      // Add more destinations as needed
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        title: Text('All Destinations Lodging'),
      ),
      body: ListView(
        children: destinationsList.map((destinationLodging) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              child: Card(
                elevation: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: DestinationLodgingCard(destinationLodging: destinationLodging),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
