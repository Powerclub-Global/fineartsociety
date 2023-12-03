// lib/pages/artist_page.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ArtistPage extends StatelessWidget {
  final int artistIndex;

  ArtistPage({required this.artistIndex});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: Text(
          'Fine Art Society',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Use LayoutBuilder to determine screen width
            LayoutBuilder(
              builder: (context, constraints) {
                // Check if the screen width is greater than a specified breakpoint
                if (constraints.maxWidth > 600) {
                  // Desktop layout
                  return Row(
                    children: [
                      // Left side: Artist Image
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Image.asset(
                            'assets/artist_$artistIndex.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      // Right side: Artist Name and Bio
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.black,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artistNames[artistIndex],
                                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Artist Bio',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Mobile layout
                  return Column(
                    children: [
                      // Artist Image
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Image.asset(
                          'assets/artist_$artistIndex.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      // Artist Name and Bio
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              artistNames[artistIndex],
                              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Artist Bio',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'FEATURED IN',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            // Carousel with Featured Press
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
                'AVAILIABLE ARTWORKS',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
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
