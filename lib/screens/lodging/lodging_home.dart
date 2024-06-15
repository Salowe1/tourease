import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/screens/home/components/app_bar.dart';
import 'package:tourease/screens/home/components/bottom_navigation_bar.dart';
import 'package:tourease/screens/lodging/components/destination_lodging_card.dart';
import 'package:tourease/constants/colors.dart';
import 'package:tourease/model/destination_lodging_model.dart';
import 'package:tourease/routes/route.dart';

class LodgingPage extends StatefulWidget {
  const LodgingPage({Key? key}) : super(key: key);

  @override
  _LodgingPageState createState() => _LodgingPageState();
}

class _LodgingPageState extends State<LodgingPage> {
  String _selectedCategory = 'House';

  final List<Map<String, String>> _properties = [
    {
      'imageUrl': 'assets/image/house.jpeg',
      'name': 'Ouaga 2000 House',
      'location': 'Ouagadougou',
      'distance': '1.8 km',
      'price': 'Rp. 2.500.000.000 / Year',
      'bedrooms': '6 Bedroom',
      'bathrooms': '4 Bathroom',
      'category': 'House',
    },
    {
      'imageUrl': 'assets/image/apartment.jpeg',
      'name': 'Skyline Apartment',
      'location': 'Ouagadougou',
      'distance': '3.0 km',
      'price': 'Rp. 1.500.000.000 / Year',
      'bedrooms': '3 Bedroom',
      'bathrooms': '2 Bathroom',
      'category': 'Apartment',
    },
    {
      'imageUrl': 'assets/image/hotel.jpeg',
      'name': 'Luxury Hotel',
      'location': 'Ouagadougou',
      'distance': '2.5 km',
      'price': 'Rp. 1.200.000 / Night',
      'bedrooms': '2 Bedroom',
      'bathrooms': '1 Bathroom',
      'category': 'Hotel',
    },
    {
      'imageUrl': 'assets/image/villa.jpeg',
      'name': 'Beachfront Villa',
      'location': 'Ouagadougou',
      'distance': '5.0 km',
      'price': 'Rp. 5.000.000 / Night',
      'bedrooms': '4 Bedroom',
      'bathrooms': '3 Bathroom',
      'category': 'Villa',
    },
  ];

  List<Map<String, String>> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    _filteredProperties = _properties
        .where((property) => property['category'] == _selectedCategory)
        .toList();
  }

  void _updateCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _filteredProperties = _properties
          .where((property) => property['category'] == _selectedCategory)
          .toList();
    });
  }

  void goToAllDestinationsLodging() {
    Get.toNamed(MyRoutes.viewAllDestinationsLodging);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36.0),
            // Location and dropdown row
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                const Text(
                  'Jakarta',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
            const SizedBox(height: 16),

            // Horizontal scrollable chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChoiceChip('House'),
                  const SizedBox(width: 8),
                  _buildChoiceChip('Apartment'),
                  const SizedBox(width: 8),
                  _buildChoiceChip('Hotel'),
                  const SizedBox(width: 8),
                  _buildChoiceChip('Villa'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Near from you section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Near from you" header and "View all" button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Near from you',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: goToAllDestinationsLodging,
                        child: Text(
                          'View all ',
                          style: TextStyle(
                            fontSize: 16,
                            color: customPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // List of lodgings horizontally scrollable
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _filteredProperties.length,
                      itemBuilder: (context, index) {
                        final property = _filteredProperties[index];
                        return DestinationLodgingCard(
                          destinationLodging: DestinationLodging(
                            imagePath: property['imageUrl']!,
                            title: property['name']!,
                            location: property['location']!,
                            rating: 4.0, // Add your own logic for rating
                            price: 0.0, // Add your own logic for price
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Recommended for you section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'More details',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 8),

                  // List of recommended properties
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredProperties.length,
                      itemBuilder: (context, index) {
                        final property = _filteredProperties[index];
                        return _buildPropertyListItem(property);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {},
        selectedIndex: 1,
      ),
    );
  }

  Widget _buildChoiceChip(String category) {
    return ChoiceChip(
      label: Text(
        category,
        style: TextStyle(
          color: _selectedCategory == category ? Colors.white : Colors.black,
        ),
      ),
      selected: _selectedCategory == category,
      onSelected: (selected) {
        _updateCategory(category);
      },
      selectedColor: customPrimary,
      backgroundColor: Colors.white,
      side: BorderSide(
        color: _selectedCategory == category ? customPrimary : Colors.white,
      ),
    );
  }

  Widget _buildPropertyListItem(Map<String, String> property) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              property['imageUrl']!,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  property['price']!,
                  style: const TextStyle(color: Colors.blue),
                ),
                Row(
                  children: [
                    const Icon(Icons.bed, size: 16),
                    const SizedBox(width: 4),
                    Text(property['bedrooms']!),
                    const SizedBox(width: 16),
                    const Icon(Icons.bathtub, size: 16),
                    const SizedBox(width: 4),
                    Text(property['bathrooms']!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
