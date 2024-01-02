// lib/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          height: 1,
        ),
      ),
      title: const Text(
        'Fine Art Society',
        style: TextStyle(
          letterSpacing: 2,
          fontSize: 20.0,
          fontFamily: 'Cinzel',
          // fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }
}
