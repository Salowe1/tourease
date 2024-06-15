import 'package:flutter/material.dart';
import 'package:tourease/screens/home/components/app_bar.dart';
import 'package:tourease/screens/home/components/bottom_navigation_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: CustomAppBar(), // Assuming CustomAppBar is implemented elsewhere
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Search for tourease contents',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Assuming customPrimary is black for this example
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
                // Implement search logic here
                // You can update search results based on the query entered
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual search results length
                itemBuilder: (context, index) {
                  // Replace with your search result widget
                  return ListTile(
                    title: Text('Search Result $index'),
                    onTap: () {
                      // Handle tapping on search result
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          // Handle bottom navigation item tap
        },
        selectedIndex: 2, // Index for SearchPage in your navigation
      ),
    );
  }
}
