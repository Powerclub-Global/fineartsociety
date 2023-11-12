import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fineartsociety/artist.dart';


class ArtistPage extends StatelessWidget {
  final int artistIndex;

  ArtistPage({required this.artistIndex});

  // Define a method to load artist data from a JSON file (replace with your data source)
  Map<String, dynamic> loadArtistData(int index) {
    // Load artist data based on artistIndex
    final jsonString = '{ "artists": [ {"name": "Artist 1", "bio": "Artist 1 bio...", "collection": [{"title": "Artwork 1", "description": "Description of Artwork 1", "image": "assets/artwork1.jpg"}] } ] }';
    final Map<String, dynamic> artistData = json.decode(jsonString);

    return artistData;
  }

  @override
  Widget build(BuildContext context) {
    final artistData = loadArtistData(artistIndex);

    final String artistName = artistData['artists'][0]['name'];
    final String artistBio = artistData['artists'][0]['bio'];
    final List collectionPieces = artistData['artists'][0]['collection'];

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
                          'assets/artist_$artistIndex.jpg', // Load the artist image
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
                              artistName, // Display the artist's name
                              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              artistBio, // Display the artist's bio
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
                  child: AppBar(
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
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text('FEATURED IN', style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
            // Display collection pieces dynamically
            ListView.builder(
              shrinkWrap: true,
              itemCount: collectionPieces.length,
              itemBuilder: (context, index) {
                final piece = collectionPieces[index];
                return ListTile(
                  title: Text(piece['title']),
                  subtitle: Text(piece['description']),
                  leading: Image.asset(piece['image']),
                );
              },
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
