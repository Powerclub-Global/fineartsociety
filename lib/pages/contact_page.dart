import 'package:fineartsociety/widgets/custom_app_bar.dart';
import 'package:fineartsociety/widgets/footer_widget.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: isDesktop
                    ? Row(
                        children: [
                          Container(
                            height: 400,
                            width: 600,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                          const Column(
                            children: [
                              Text(
                                "GET IN TOUCH",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                "2301 COLLINS AVE \n MAIMI BEACH, FL",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "305-984-7801",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "FINEARTSOCIETY@GMAIL.COM",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
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
                            "GET IN TOUCH",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            "2301 COLLINS AVE \n MAIMI BEACH, FL",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "305-984-7801",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "FINEARTSOCIETY@GMAIL.COM",
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
