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
          double firstFoldHeight = MediaQuery.of(context).size.height * 0.9;
          bool isDesktop = MediaQuery.of(context).size.width > 607;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Hero Image
                SizedBox(
                  height: 0.0490797546 * MediaQuery.sizeOf(context).height,
                ),
                Text(
                  "FAIRS AND EXHIBITIONS",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 0.03680981595 * MediaQuery.sizeOf(context).height,
                ),
                isDesktop
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2019",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            width: 0.0490797546 *
                                MediaQuery.sizeOf(context).height,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2020",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            width: 0.0490797546 *
                                MediaQuery.sizeOf(context).height,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2021",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            width: 0.0490797546 *
                                MediaQuery.sizeOf(context).height,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2022",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            width: 0.0490797546 *
                                MediaQuery.sizeOf(context).height,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2023",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2019",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2020",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2021",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2022",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "2023",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )),
                        ],
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
                SizedBox(
                  height: 0.0736196319 * MediaQuery.sizeOf(context).height,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    height: 380,
                    width: 540,
                  ),
                ),
                Text(
                  "Red Dot and Spectrum",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "December X - December X 2022",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),

                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "2023",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: isDesktop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 340,
                                  width: 500,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Red Dot and Spectrum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "December X - December X 2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 340,
                                  width: 500,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Red Dot and Spectrum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "December X - December X 2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 340,
                                  width: 500,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Red Dot and Spectrum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "December X - December X 2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                  height: 340,
                                  width: 500,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Red Dot and Spectrum",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "December X - December X 2022",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
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
