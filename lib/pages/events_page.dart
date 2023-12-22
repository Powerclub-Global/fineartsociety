import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/blocks_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';

class EventsPage extends StatelessWidget {
  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    final data = await json.decode(response);
    return data['events'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight = MediaQuery.of(context).size.height * 0.6;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Hero Image
                Container(
                  height: firstFoldHeight,
                  child: Center(
                    child: Text(
                      'NEXT EVENT',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 20,
                            side: BorderSide(
                                color: Colors.amber,
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside)),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Request Access',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   height: firstFoldHeight,
                //   color: Colors.black,
                //   child: Column(
                //     children: [
                //    ,

                // Positioned(
                //   bottom: 20,
                //   left: 0,
                //   right: 0,
                //   child: Center(
                //     child: ElevatedButton(
                //       onPressed: () {},
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.black,
                //           elevation: 20,
                //           side: BorderSide(
                //               color: Colors.amber,
                //               width: 2,
                //               strokeAlign:
                //                   BorderSide.strokeAlignOutside)),
                //       child: Padding(
                //         padding: EdgeInsets.all(15),
                //         child: Text(
                //           'Request Access',
                //           style: TextStyle(
                //             fontSize: 25,
                //             color: Colors.amber,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                //     ],
                //   ),
                // ),

                // 2. Press Carousel
                // SizedBox(height: 20),
                //       Center(
                //         child: Text(
                //           'PREVIOUS EXPERIENCES',
                //           style: TextStyle(fontSize: 14, color: Colors.white),
                //         ),
                //       ),
                // Container(
                //   color: Colors.black,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       SizedBox(height: 20),
                //       Center(
                //         child: Text(
                //           'PREVIOUS EXPERIENCES',
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
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'PAST EXPERIENCE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),

                // 3. Featured Artists
                FutureBuilder(
                    future: readJson(),
                    builder: (context, snapshot) {
                      return BuildBlockGrid(
                        girdData: snapshot.data!,
                        isRectangular: true,
                      );
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
