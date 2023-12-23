import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/blocks_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';

class ExhibitionPage extends StatelessWidget {
  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    var data = await json.decode(response);
    List<dynamic> artists = data['artists'];
    List<dynamic> featuredArtists = artists.where((item) {
      return item['featured'] == true;
    }).toList();
    print(featuredArtists);
    return featuredArtists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight = MediaQuery.of(context).size.height * 0.75;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Hero Image
                Container(
                  height: firstFoldHeight,
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/Construction-cuate.svg',
                            semanticsLabel: 'Web Page Under Construction'),
                      ),
                      // Positioned(
                      //   bottom: 20,
                      //   left: 0,
                      //   right: 0,
                      //   child: Center(
                      //     child: ElevatedButton(
                      //       onPressed: () {
                      //         launchUrl(Uri.parse(
                      //             'https://app.tryspace.com/M6aiq2y/society-fine-art'));
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.black,
                      //       ),
                      //       child: Text(
                      //         'Enter Virtual Gallery',
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                // // 2. Press Carousel
                // Container(
                //   color: Colors.black,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       SizedBox(height: 20),
                //       Center(
                //         child: Text(
                //           'FEATURED IN',
                //           style: TextStyle(fontSize: 14, color: Colors.white),
                //         ),
                //       ),
                //       CarouselSlider(
                //         items: [
                //           'assets/press1.png',
                //           'assets/press2.png',
                //           'assets/press3.png',
                //           'assets/press1.png',
                //           'assets/press2.png',
                //           'assets/press3.png',
                //         ].map((pressImagePath) {
                //           return Image.asset(pressImagePath);
                //         }).toList(),
                //         options: CarouselOptions(
                //           height: constraints.maxWidth <= 600
                //               ? firstFoldHeight * 0.2
                //               : firstFoldHeight * 0.2,
                //           autoPlay: true,
                //           viewportFraction:
                //               constraints.maxWidth <= 600 ? 0.2 : 0.2,
                //           enableInfiniteScroll: false,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'UNDER CONSTRUCTION',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                // 3. Featured Artists
                // FutureBuilder(
                //     future: readJson(),
                //     builder: (context, snapshot) {
                //       return BuildBlockGrid(girdData: snapshot.data!, isRectangular: false,);
                //     }),
                // 4, Use the FooterWidget here
                FooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
