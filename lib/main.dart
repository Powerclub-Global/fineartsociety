import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArtistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int artistIndex = ModalRoute.of(context)!.settings.arguments as int? ?? 0;
    final List<String> pressImages = [
      'assets/press1.png',
      'assets/press2.png',
      'assets/press3.png',
    ];

    final List<String> artistNames = [
      'Artist 1',
      'Artist 2',
      'Artist 3',
      'Artist 4',
      'Artist 5',
      'Artist 6',
      'Artist 7',
      'Artist 8',
      'Artist 9',
      'Artist 10',
      'Artist 11',
      'Artist 12',
      'Artist 13',
      'Artist 14',
      'Artist 15',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.asset(
                          'assets/artist_$artistIndex.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              artistNames[artistIndex],
                              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Artist Bio',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomAppBar(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'FEATURED IN',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            CarouselSlider(
              items: pressImages.map((pressImagePath) {
                return Image.asset(pressImagePath);
              }).toList(),
              options: CarouselOptions(
                height: 100,
                autoPlay: true,
                viewportFraction: 0.2,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'FEATURED ARTISTS',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            // Rest of the artist page content here
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.black,
              child: Center(
                child: Text(
                  '© Fine Art Society',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          'FINE ART SOCIETY',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }
}