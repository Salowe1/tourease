import 'package:flutter/material.dart';
import 'package:tourease/screens/home/components/destination_card.dart';
import 'package:tourease/screens/home/components/app_bar.dart';
import 'package:tourease/screens/home/components/bottom_navigation_bar.dart';
import 'package:tourease/constants/colors.dart';
import 'package:tourease/model/destination_model.dart';
import 'package:get/get.dart';
import 'package:tourease/routes/route.dart';

class HomePage extends StatelessWidget {
  void goToAllDestinations() {
    Get.toNamed(MyRoutes.viewAllDestinations);
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
            const SizedBox(height: 35),
            Stack(
              children: [
                Positioned(
                  left: 145,
                  top:  28,
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 20,
                    child: CustomPaint(
                      painter: _ArcPainter(),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                RichText(
                  text: const TextSpan(
                    text: 'Explore the ',
                    style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Beautiful ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 145, 69),
                        ),
                      ),
                      TextSpan(
                        text: 'world!',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 38, 140, 67),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Destination',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  onPressed: goToAllDestinations,
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 16,
                      color: customPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DestinationCard(
                    destination: Destination(
                      imagePath: 'assets/image/destination1.jpeg',
                      title: 'Ruine de Lorépeni',
                      location: 'location',
                      rating: 4.7,
                      price: 1000,
                    ),
                  ),
                  DestinationCard(
                    destination: Destination(
                      imagePath: 'assets/image/destination2.jpeg',
                      title: 'Hotel Laico',
                      location: 'location',
                      rating: 4.5,
                      price: 2000,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {},
        selectedIndex:  0,
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 20, 161, 60)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height / 2)
      ..quadraticBezierTo(size.width * 3 / 4, size.height / 5, size.width, size.height / 3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
