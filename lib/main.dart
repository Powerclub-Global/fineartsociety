import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fine Art Society',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/artist': (context) => ArtistPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use CustomAppBar as the app bar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/background_image.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'FINE ART SOCIETY',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'FEATURED IN',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black, // Set the background color to black
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: [
                            'assets/press1.png',
                            'assets/press2.png',
                            'assets/press3.png',
                          ].map((pressImagePath) {
                            return Image.asset(pressImagePath);
                          }).toList(),
                          options: CarouselOptions(
                            height: 100,
                            autoPlay: true,
                            viewportFraction: 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'FEATURED ARTISTS',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: List.generate(artistNames.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/artist', arguments: index);
                  },
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/artist_$index.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        artistNames[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'FEATURED IN',
                style: TextStyle(fontSize: 14, color: Colors.white),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Fine Art Society',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black, // Set the app bar background color to black
      centerTitle: true,
    );
  }
}
