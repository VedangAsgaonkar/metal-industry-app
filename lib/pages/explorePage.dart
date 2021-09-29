// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:stockclone/pages/detailedPage.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.black,
          child: SafeArea(
            child: Column(children: [
              Text("Explore",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: Text(
                            'Liked',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            )
                        ))
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: MediaQuery.of(context).size.height-200,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return detailedPage();
                                }));
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 80),
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.amber[200],
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/industry1.png'
                                        ),
                                        backgroundColor: Colors.transparent,
                                        radius: 110.0,
                                      ),
                                      Text(
                                        'Delhi Lead Pvt. Ltd.',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'High quality lead',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              /*Visibility(
                  visible: isVisible,
                  child: ListWheelScrollView(itemExtent: 5, children: [
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey'),
                    Text('hey')
                  ]))*/
            ]),
          ),
        ),
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
