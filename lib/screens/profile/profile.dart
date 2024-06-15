import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import your custom routes and components
import 'package:tourease/routes/app_route.dart';
import 'package:tourease/routes/route.dart';
import 'package:tourease/constants/colors.dart';
import 'package:tourease/screens/home/components/bottom_navigation_bar.dart';
import 'package:tourease/screens/home/components/app_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;
  File? _imageFile;
  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadImage();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('user_name') ?? '';
      _email = prefs.getString('user_email') ?? '';
    });
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null && imagePath.isNotEmpty) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  Future<void> _saveImage(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', imagePath);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Get.offAllNamed(MyRoutes.home);
        break;
      case 1:
        Get.offAllNamed(MyRoutes.lodging);
        break;
      case 2:
        Get.offAllNamed(MyRoutes.search);
        break;
      case 3:
        Get.offAllNamed(MyRoutes.food);
        break;
      case 4:
        Get.offAllNamed(MyRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            GestureDetector(
              onTap: () {
                _selectImage(context);
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: ClipOval(
                      child: _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            )
                          : Image.asset(
                              'assets/image/profile.jpg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: customPrimary,
                      child: IconButton(
                        icon: Icon(Icons.file_upload, color: Colors.white),
                        onPressed: () {
                          _selectImage(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              _name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              _email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem('Reward Points', '360'),
                  _buildStatItem('Travel Trips', '238'),
                  _buildStatItem('Bucket List', '473'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            _buildProfileOption(Icons.account_circle, 'My Account', () {
              Get.toNamed(MyRoutes.signup); // Navigate to sign up page
            }),
            _buildProfileOption(Icons.favorite, 'Favorites', () {
              Get.toNamed(MyRoutes.favorite); // Navigate to favorite page using MyRoutes
            }),
            _buildProfileOption(Icons.language, 'Language', () {
              Get.toNamed(MyRoutes.language); // Navigate to language page using MyRoutes
            }),
            _buildProfileOption(Icons.help_outline, 'FAQ / Customer Service', () {
              Get.toNamed(MyRoutes.faq); // Navigate to FAQ page using MyRoutes
            }),
            _buildProfileOption(Icons.info, 'Terms and Policies', () {
              Get.toNamed(MyRoutes.termsAndPolicies); // Navigate to terms and policies page
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: customPrimary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onPressed) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onPressed,
    );
  }

  void _selectImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _saveImage(pickedFile.path);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }
}
