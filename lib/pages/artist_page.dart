// lib/pages/artist_page.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../widgets/footer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  bool hasInitialised = false;
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<void> initialize() async {
      prefs = await SharedPreferences.getInstance();
      setState(() {
        hasInitialised = true;
      });
    }

    initialize();
  }

  @override
  Widget build(BuildContext context) {
    var artistData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final List<String> pressImages = [
      'assets/press1.png',
      'assets/press2.png',
      'assets/press3.png',
    ];

    var artistArtWork;

    var artistIndex;
    if (hasInitialised) {
      if (artistData == null) {
        List<dynamic> ourJson = [
          {
            "name": "DO WHAT YOU LOVE",
            "bio": "Do What You Love Artist...",
            "image": "artist_0.png",
            "collection": [
              {
                "title": "Artwork 1.1",
                "description": "Description of Artwork 1.1",
                "image": "assets/artist1_artwork1.png"
              },
              {
                "title": "Artwork 1.2",
                "description": "Description of Artwork 1.2",
                "image": "assets/artist1_artwork2.png"
              },
              {
                "title": "Artwork 1.3",
                "description": "Description of Artwork 1.3",
                "image": "assets/artist1_artwork3.png"
              }
            ]
          },
          {
            "name": "AMER.SM",
            "bio": "Amer.SM...",
            "image": "artist_1.png",
            "collection": [
              {
                "title": "Artwork 2.1",
                "description": "Description of Artwork 2.1",
                "image": "assets/artist2_artwork1.png"
              },
              {
                "title": "Artwork 2.2",
                "description": "Description of Artwork 2.2",
                "image": "assets/artist2_artwork2.png"
              },
              {
                "title": "Artwork 2.3",
                "description": "Description of Artwork 2.3",
                "image": "assets/artist2_artwork3.png"
              }
            ]
          },
          {
            "name": "INESSA",
            "bio": "Iness Fine Art...",
            "image": "artist_2.png",
            "collection": [
              {
                "title": "Artwork 3.1",
                "description": "Description of Artwork 3.1",
                "image": "assets/artist3_artwork1.png"
              },
              {
                "title": "Artwork 3.2",
                "description": "Description of Artwork 3.2",
                "image": "assets/artist3_artwork2.png"
              },
              {
                "title": "Artwork 3.3",
                "description": "Description of Artwork 3.3",
                "image": "assets/artist3_artwork3.png"
              }
            ]
          },
          {
            "name": "KYLE SCHINDLER",
            "bio": "Bio...",
            "image": "artist_3.png",
            "collection": []
          },
          {
            "name": "TRANSPARENT",
            "bio": "Bio...",
            "image": "artist_4.png",
            "collection": []
          },
          {
            "name": "JOSEPH SKALA",
            "bio": "Bio...",
            "image": "artist_5.png",
            "collection": []
          },
          {
            "name": "LEIDY MAZO",
            "bio": "Bio...",
            "image": "artist_6.png",
            "collection": []
          },
          {
            "name": "ALEJANDRO GLATT",
            "bio": "Bio...",
            "image": "artist_7.png",
            "collection": []
          },
          {
            "name": "CASH MONET",
            "bio": "Bio...",
            "image": "artist_8.png",
            "collection": []
          },
          {
            "name": "EDDY BOGAERT",
            "bio": "Bio...",
            "image": "artist_9.png",
            "collection": []
          },
          {
            "name": "JOHNNY DOLLAR",
            "bio": "Bio...",
            "image": "artist_10.png",
            "collection": []
          },
          {
            "name": "SAM P.",
            "bio": "Bio...",
            "image": "artist_11.png",
            "collection": []
          }
        ];
        int? index = prefs.getInt('artist');
        artistData = ourJson[index!];
        artistIndex = index;
      } else {
        artistIndex = artistData["index"];
        prefs.setInt('artist', artistIndex);
        artistData = artistData["data"];
      }
      artistArtWork = artistData!['collection'];
      print(artistArtWork);
    }

    return hasInitialised
        ? Scaffold(
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Image.asset(
                                  artistData!['image'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
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
                                    artistData['name'],
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    artistData['bio'],
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Image.asset(
                                artistData!['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
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
                                  artistData['name'],
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  artistData['bio'],
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
                    'AVAILABLE ARTWORKS',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Art Works available implemented here
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(artistArtWork.length, (index) {
                    return InkWell(
                      child: Container(
                        width: 240,
                        height: 240,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(artistArtWork[index]['image']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            artistArtWork[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                // Use the FooterWidget here
                FooterWidget(),
              ],
            )),
          )
        : LoadingAnimationWidget.threeRotatingDots(
            color: Colors.amber, size: 50);
  }
}