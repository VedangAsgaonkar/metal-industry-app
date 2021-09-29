import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class detailedPage extends StatelessWidget {
  const detailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Container(
            child: Column(children: [
              Expanded(
                flex: 6,
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: [],
                ),
              ),
              Expanded(flex: 4, child: Text('XYZ')),
            ])));
  }
}