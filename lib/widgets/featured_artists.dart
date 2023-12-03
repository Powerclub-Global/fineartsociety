import 'package:flutter/material.dart';

class FeaturedArtists extends StatelessWidget {
  final List<String> artistNames;

  FeaturedArtists({required this.artistNames});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  color: Colors.black,
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
    );
  }
}
