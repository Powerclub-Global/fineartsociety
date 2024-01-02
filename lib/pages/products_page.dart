import 'package:carousel_slider/carousel_slider.dart';
import 'package:fineartsociety/widgets/custom_app_bar.dart';
import 'package:fineartsociety/widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'products_page.g.dart';

@riverpod
class Count extends _$Count {
  @override
  int build() => 1;

  void increment() {
    state++;
  }

  void decrement(BuildContext context) {
    if (state != 1) {
      state--;
    } else {
      IconSnackBar.show(
          context: context,
          snackBarType: SnackBarType.alert,
          label: 'Sorry! The Quantity Cannot be Less than 1');
    }
  }
}

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double firstFoldHeight = MediaQuery.of(context).size.height * 0.75;
    int value = ref.watch(countProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = MediaQuery.of(context).size.width > 1168;
          return SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: isDesktop
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 500,
                                width: 700,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: SizedBox(
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Bar Accessories Travel Set",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 35),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          const Text(
                                            "\$ 2,000.00",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Shipping calculated at checkout",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          const Text(
                                            "Quantity",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.amber,
                                                    width: 0.2)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(countProvider
                                                            .notifier)
                                                        .increment();
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  '$value',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(countProvider
                                                            .notifier)
                                                        .decrement(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(
                                                    double.maxFinite, 50),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "Buy Now",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              )),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(
                                                    double.maxFinite, 50),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.handshake,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Safe\nTransactions",
                                            softWrap: true,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.people,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            "Connect\nwith Artist",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Verified and\nTrusted Artist",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    "☝️ One-Time Payment, No Monthly Fees",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 30, bottom: 60, left: 60),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          "Boost your Wall Decour, form your Villa.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40),
                                          softWrap: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "This Artwork was meant to be hung on walls of the\nplace you call home",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Purely HandMade",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "Directly from the hands of the Artist to your wall",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "Non-Standard, Artist Centric Prices",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 500,
                                  width: 700,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 500,
                                  width: 700,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 60, right: 100),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          "Things to Note",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40),
                                          softWrap: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "what's unique in this artwork?",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.brush,
                                            color: Colors.pink,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Conventional Paint Art Style",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.rectangle_rounded,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              "Dimensions (Height, Width):  820cm X 1920cm",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.water_drop,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("100mm Water Resistant paint",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 130,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("They trust us",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25)),
                                SizedBox(
                                  height: 50,
                                ),
                                CarouselSlider(
                                  items: [
                                    'assets/press1.png',
                                    'assets/press2.png',
                                    'assets/press3.png',
                                    'assets/press1.png',
                                    'assets/press2.png',
                                    'assets/press3.png',
                                  ].map((pressImagePath) {
                                    return Image.asset(pressImagePath);
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: constraints.maxWidth <= 600
                                        ? firstFoldHeight * 0.2
                                        : firstFoldHeight * 0.2,
                                    autoPlay: true,
                                    viewportFraction:
                                        constraints.maxWidth <= 600 ? 0.2 : 0.2,
                                    enableInfiniteScroll: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  "Do you have any questions?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text("Come and talk to us!",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                SizedBox(
                                  height: 40,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        minimumSize: Size(180, 70),
                                        backgroundColor: Colors.amber,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            side: BorderSide(
                                                color: Colors.white))),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/contact');
                                    },
                                    child: Text(
                                      "Contact us",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19),
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: 400,
                            width: 600,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            "TITLE",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            "DATE/TIME",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "LOCATION",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "DESCRIPTION",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ],
                      ),
              ),
              FooterWidget()
            ],
          ));
        },
      ),
    );
  }
}
