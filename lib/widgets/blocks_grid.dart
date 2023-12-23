import 'package:flutter/material.dart';

class BuildBlockGrid extends StatelessWidget {
  final List<dynamic> girdData;
  final bool isRectangular;

  BuildBlockGrid({required this.girdData, required this.isRectangular});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Set the background color here
      child: Column(
        children: [
          Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.center,
            children: List.generate(girdData.length, (index) {
              return InkWell(
                onTap: () {
                  !isRectangular
                      ? Navigator.pushNamed(context, '/artist',
                          arguments: {"index": index, "data": girdData[index]})
                      : null;
                },
                child: Container(
                  width: isRectangular ? 320 : 240,
                  height: 240,
                  decoration: BoxDecoration(
                    image: !isRectangular
                        ? DecorationImage(
                            image: AssetImage('assets/artist_$index.png'),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(10),
                    color: isRectangular ? Colors.grey : Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      isRectangular ? '' : girdData[index]['name'],
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
