import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({required this.companyName});
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                ),
                items: [1].map((i){
                  return Builder(
                    builder: (BuildContext context) {
                      return Image(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        image: AssetImage('assets/images/industry1.png'),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      companyName,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Quality products since 12 yrs',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[350],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey[350],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Tag(
                          label: 'Litharge',
                        ),
                        Tag(
                          label: 'Batteries',
                        ),
                        Tag(
                          label: 'Delhi',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Products : Lead batteries, Litharge, Massicot, lead nodules, solder metal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey[350],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Owner : Mr. Vaibhav Pandey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Contact : +91-9876543210',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Address : C-231 Industrial Area, Ghaziabad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String label;
  final Color bodyColor = Color(0xFFF436BE);
  Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(
            color: bodyColor,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: bodyColor,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
