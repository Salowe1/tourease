import 'package:flutter/material.dart';
import 'package:tourease/screens/home/components/destination_card.dart';
import 'package:tourease/model/destination_model.dart';

class ViewAllDestinationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example list of destinations
    List<Destination> destinationsList = [
      Destination(
        imagePath: 'assets/image/destination1.jpeg',
        title: 'Ruine de Lorépeni',
        location: 'location',
        rating: 4.7,
        price: 1000,
      ),
      Destination(
        imagePath: 'assets/image/destination2.jpeg',
        title: 'Hotel Laico',
        location: 'location',
        rating: 4.5,
        price: 2000,
      ),
      // Add more destinations as needed
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        title: Text('All Destinations'),
      ),
      body: ListView(
        children: destinationsList.map((destination) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.94, // Adjust width as needed
                child: Card(
                  elevation: 0,
                  child: SizedBox(
                    width: double.infinity, // Ensure the Card takes full width of its parent
                    child: DestinationCard(destination: destination),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
