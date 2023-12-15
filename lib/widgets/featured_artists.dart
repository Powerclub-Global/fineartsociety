import 'package:flutter/material.dart';

class FeaturedArtists extends StatelessWidget {
  final List<dynamic> artistData;

  FeaturedArtists({required this.artistData});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color here
      child: Column(
        children: [
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
            children: List.generate(artistData.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/artist', arguments: artistData[index]);
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
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      artistData[index]['name'],
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
    );
  }
}
