import 'package:fineartsociety/widgets/custom_app_bar.dart';
import 'package:fineartsociety/widgets/footer_widget.dart';
import 'package:flutter/material.dart';

class IndivisualPage extends StatelessWidget {
  const IndivisualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight = MediaQuery.of(context).size.height * 0.75;
          bool isDesktop = MediaQuery.of(context).size.width > 1168;

          return SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: isDesktop
                    ? Row(
                        children: [
                          Container(
                            height: 500,
                            width: 700,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1736,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Column(
                              children: [
                                Text(
                                  "TITLE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  "DATE/TIME",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "LOCATION",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "DESCRIPTION",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
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
