// lib/widgets/footer_widget.dart
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  // Define the menu items
  final List<String> menuItems = ['Gallery', 'Artists', 'Events', 'Exhibitions', 'News', 'Contact'];

  @override
  Widget build(BuildContext context) {
    // Check if the screen width is greater than a specified breakpoint
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        children: [
          // Navigation Bar
          isDesktop
              ? // Desktop layout
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: menuItems.map((item) {
                    return TextButton(
                      onPressed: () {
                        // Navigate to the corresponding page for each menu item
                        // You can replace the '/' with the actual route for each menu item
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                )
              : // Mobile layout
              Column(
                  children: menuItems.map((item) {
                    return TextButton(
                      onPressed: () {
                        // Navigate to the corresponding page for each menu item
                        // You can replace the '/' with the actual route for each menu item
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }).toList(),
                ),
          
          SizedBox(height: 20),
          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/facebook_icon.png', // Replace with your Facebook icon asset
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/instagram_icon.png', // Replace with your Instagram icon asset
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/x_icon.png', // Replace with your Twitter icon asset
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/google_icon.png', // Replace with your Google icon asset
                width: 30,
                height: 30,
              ),
            ],
          ),
          SizedBox(height: 20),
          // Copyright Text
          Center(
            child: Text(
              'Fine Art Society © All Rights Reserved. ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
