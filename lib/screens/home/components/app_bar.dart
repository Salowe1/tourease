import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourease/constants/colors.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/route.dart';
import 'package:tourease/controllers/cart_controller.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onImagePick;
  final File? imageFile;

  const CustomAppBar({Key? key, this.onImagePick, this.imageFile}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isClicked = false;
  File? _imageFile;
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    _loadImage();
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.onImagePick,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: ClipOval(
                child: _imageFile != null
                    ? Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      )
                    : Image.asset(
                        'assets/image/profile.jpg',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            color: customPrimary,
                            size: 30,
                          );
                        },
                      ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: <Widget>[
                    const Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 3,
                child: Obx(
                  () => Text(
                    ' ${cartController.cartCount}',
                    style: TextStyle(color: customPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 3,
                right: 2,
                child: IconButton(
                  icon: Icon(
                    isClicked ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                    color: customPrimary,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      isClicked = !isClicked;
                    });

                    // Navigate to cart page
                    final future = Get.toNamed(MyRoutes.addedToCart);
                    future?.then((_) {
                      // Set isClicked back to false after navigation completes
                      setState(() {
                        isClicked = false;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
