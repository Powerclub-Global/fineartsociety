import 'dart:convert';
import 'package:fineartsociety/widgets/custom_app_bar.dart';
import 'package:fineartsociety/widgets/blocks_grid.dart';
import 'package:fineartsociety/widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllArtistsPage extends StatelessWidget {
  const AllArtistsPage({super.key});

  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    final data = await json.decode(response);
    return data['artists'];
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
                // // 1. Hero Image
                // Container(
                //   height: firstFoldHeight,
                //   color: Colors.black,
                //   child: Stack(
                //     children: [
                //       Image.asset(
                //         'assets/background_image.jpg',
                //         fit: BoxFit.cover,
                //         width: double.infinity,
                //         height: double.infinity,
                //       ),
                //       Positioned(
                //         bottom: 20,
                //         left: 0,
                //         right: 0,
                //         child: Center(
                //           child: ElevatedButton(
                //             onPressed: () {
                //               _launchVirtualGallery() async {
                //                 const url =
                //                     'https://app.tryspace.com/M6aiq2y/society-fine-art';
                //                 if (await canLaunch(url)) {
                //                   await launch(url);
                //                 } else {
                //                   throw 'Could not launch $url';
                //                 }
                //               }
                //             },
                //             style: ElevatedButton.styleFrom(
                //               backgroundColor: Colors.black,
                //             ),
                //             child: Text(
                //               'Enter Virtual Gallery',
                //               style: TextStyle(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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
                    'ALL ARTISTS',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                // 3. Featured Artists
                FutureBuilder(
                    future: readJson(),
                    builder: (context, snapshot) {
                      return BuildBlockGrid(girdData: snapshot.data!, isRectangular: false,);
                    }),

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
