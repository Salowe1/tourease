// CustomBottomNavigationBar.dart
import 'package:flutter/material.dart';
import 'package:tourease/constants/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  CustomBottomNavigationBar({
    required this.onItemTapped,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'bottomNavigationBar',
      child: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 242, 242, 242),
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
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
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bed),
                label: 'Lodging',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: customPrimary,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: selectedIndex * MediaQuery.of(context).size.width / 5,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 5,
              decoration: BoxDecoration(
                color: customPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
