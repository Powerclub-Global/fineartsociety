// lib/widgets/footer_widget.dart
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.black,
      child: Column(
        children: [
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
