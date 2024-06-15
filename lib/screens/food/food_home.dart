import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tourease/screens/home/components/app_bar.dart'; // Adjust this import if necessary
import 'package:tourease/screens/home/components/bottom_navigation_bar.dart'; // Adjust this import if necessary
import 'package:tourease/constants/colors.dart'; // Adjust this import if necessary

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _selectedIndex = 0; // Selected index for top categories
  int _bottomSelectedIndex = 3; // Selected index for bottom navigation bar

  final List<String> _categories = ['Foods', 'Drinks', 'Snacks', 'Sauces'];

  // Reduced list of restaurants with descriptions
  final List<Map<String, dynamic>> _restaurants = [
    {
      'name': 'Restaurant A',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed commodo ipsum sit amet.',
      'url': 'https://g.co/kgs/bCyVm2y',
    },
    {
      'name': 'Restaurant B',
      'description':
          'Aenean consectetur commodo scelerisque. Fusce vel turpis fermentum, posuere ex.',
      'url': 'https://g.co/kgs/bCyVm2y',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Delicious food for you',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 30),
                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _categories.asMap().entries.map((entry) {
                    int index = entry.key;
                    String category = entry.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedIndex == index
                                  ? customPrimary
                                  : Colors.grey,
                            ),
                          ),
                          if (_selectedIndex == index)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 2,
                              width: 30,
                              color: customPrimary,
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          // Food Cards with horizontal scroll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCardsForCurrentCategory(),
            ),
          ),
          SizedBox(height: 20),
          // Best Restaurants section
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _restaurants[index]['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    _restaurants[index]['description'],
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Open URL when tapped
                    launchURL(_restaurants[index]['url']);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          setState(() {
            _bottomSelectedIndex = index;
          });
          navigateToScreen(index); // Function to navigate based on index
        },
        selectedIndex: _bottomSelectedIndex,
      ),
    );
  }

  List<Widget> _buildCardsForCurrentCategory() {
    switch (_selectedIndex) {
      case 0:
        return _buildFoodCategoryCards();
      case 1:
        return _buildDrinkCategoryCards();
      case 2:
        return _buildSnackCategoryCards();
      case 3:
        return _buildSauceCategoryCards();
      default:
        return _buildFoodCategoryCards(); // Default to Foods category
    }
  }

  List<Widget> _buildFoodCategoryCards() {
    return [
      _buildFoodCard(
        title: 'Burger',
        description:
            'Delicious Beef with assorted toppings and crispy crust.',
        price: '7000 FCFA',
        imagePath: 'assets/image/food.jpeg',
      ),
      _buildFoodCard(
        title: 'Pizza',
        description:
            'Delicious pizza with assorted toppings and crispy crust.',
        price: '5000 FCFA',
        imagePath: 'assets/image/pizza.jpeg',
      ),
      // Add more FoodCard widgets as needed
    ]
        .map((foodCard) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: foodCard,
            ))
        .toList();
  }

  List<Widget> _buildDrinkCategoryCards() {
    return [
      _buildDrinkCard(
        title: 'Special Tourease',
        description: 'Fresh drinks to kickstart your day.',
        price: '3000 FCFA',
        imagePath: 'assets/image/drink.png',
      ),
      _buildDrinkCard(
        title: 'Special Juice',
        description: 'Fresh orange juice to kickstart your day.',
        price: '3000 FCFA',
        imagePath: 'assets/image/juice.jpeg',
      ),
      // Add more DrinkCard widgets as needed
    ]
        .map((drinkCard) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: drinkCard,
            ))
        .toList();
  }

  List<Widget> _buildSnackCategoryCards() {
    return [
      _buildSnackCard(
        title: 'Fruits',
        description: 'Tasty natural fruits for snack time.',
        price: '1500 FCFA',
        imagePath: 'assets/image/fruits.jpeg',
      ),
     _buildSnackCard(
        title: 'Fruits',
        description: 'Tasty natural fruits for snack time.',
        price: '1500 FCFA',
        imagePath: 'assets/image/fruits.jpeg',
      ),
      // Add more SnackCard widgets as needed
    ]
        .map((snackCard) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: snackCard,
            ))
        .toList();
  }

  List<Widget> _buildSauceCategoryCards() {
    return [
      _buildSauceCard(
        title: 'Tomatoes Sauce ',
        description: 'Classic Tomatoes Saucefor your favorite snacks.',
        price: '1000 FCFA',
        imagePath: 'assets/image/sauce.jpeg',
      ),
      _buildSauceCard(
        title: 'Tomatoes Sauce ',
        description: 'Classic Tomatoes Saucefor your favorite snacks.',
        price: '1000 FCFA',
        imagePath: 'assets/image/sauce.jpeg',
      ),
      // Add more SauceCard widgets as needed
    ]
        .map((sauceCard) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: sauceCard,
            ))
        .toList();
  }

  Widget _buildFoodCard({
    required String title,
    required String description,
    required String price,
    required String imagePath,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: customPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Implement action for 'Add to Cart' or any other interaction
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: customPrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                             
                            color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrinkCard({
    required String title,
    required String description,
    required String price,
    required String imagePath,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: customPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Implement action for 'Add to Cart' or any other interaction
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: customPrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSnackCard({
    required String title,
    required String description,
    required String price,
    required String imagePath,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: customPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Implement action for 'Add to Cart' or any other interaction
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: customPrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSauceCard({
    required String title,
    required String description,
    required String price,
    required String imagePath,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 250,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: customPrimary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Implement action for 'Add to Cart' or any other interaction
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: customPrimary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/lodging');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/food');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

