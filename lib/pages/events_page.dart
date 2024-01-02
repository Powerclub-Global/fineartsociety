import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/blocks_grid.dart';
import '../widgets/footer_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

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
      appBar: const CustomAppBar(),
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
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Stack(
                    children: [
                      const Center(
                        child: Text(
                          'NEXT EVENT',
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Countdown(
                            seconds: 259000,
                            build: (BuildContext context, double time) {
                              Duration Time = Duration(seconds: time.round());
                              int Days = Time.inDays;
                              int Hours = Time.inHours - Days * 24;
                              int Minutes = Time.inMinutes - Time.inHours * 60;

                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Colors.amber, width: 2.5),
                                  color: Colors.black,
                                ),
                                height: 130,
                                width: 500,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            Days.toString().length == 1
                                                ? '0$Days'
                                                : '$Days',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 209, 163, 23),
                                                fontSize: 50),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'DAYS',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$Hours',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 209, 163, 23),
                                                fontSize: 50),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'HOURS',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$Minutes',
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 209, 163, 23),
                                                fontSize: 50),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            'MINUTES',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                              );
                            },
                            interval: const Duration(minutes: 1),
                            onFinished: () {
                              print('Timer is done!');
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(
                                color: Colors.amber,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside)),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            ' REQUEST ACCESS ',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 211, 161, 11),
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
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'PAST EXPERIENCE',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // 3. Featured Artists
                FutureBuilder(
                    future: readJson(),
                    builder: (context, snapshot) {
                      return BuildBlockGrid(
                        girdData: snapshot.data!,
                        isRectangular: true,
                        isEvent: true,
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
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
