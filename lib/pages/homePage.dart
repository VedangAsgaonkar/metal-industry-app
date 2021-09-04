import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';
import 'package:stockclone/widgets/newsList.dart';
import 'package:stockclone/widgets/stockList.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _offsetY = 100;
  ExpandedState _expandedState = ExpandedState.compact;

  double _calculateOffset(delta, context) {
    final maxHeight = MediaQuery.of(context).size.height - 100;
    final newOffset = _offsetY + (delta) * (-1);
    if (newOffset <= 100) {
      return 100;
    } else if (newOffset >= maxHeight) {
      return maxHeight;
    } else {
      return newOffset;
    }
  }

  String stockName = "";
  List<String> locations = <String>['North', 'South', 'East', 'West'];
  String? currentLocation = 'North';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: LeftMenu(),
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: Container(
            width: 350.0,
            child: Drawer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        stockName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuButton(),
                        Text("Metals",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 40.0,
                        ),
                        Container(
                          color: Colors.black,
                          child: DropdownButton(
                            items: locations.map((location) {
                              return DropdownMenuItem(
                                value: location,
                                child: Text(
                                  location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                            value: currentLocation,
                            onChanged: (String? newLocation) {
                              setState(() {
                                currentLocation = newLocation;
                              });
                            },
                            dropdownColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text("December 3",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 310,
                      child: StockList(currentLocation),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  height: _offsetY,
                  duration: Duration(milliseconds: 1),
                  curve: Curves.easeInOut,
                  child: NewsList(
                    expandedState: this._expandedState,
                    onPanUpdate: (dragDetails) {
                      setState(() {
                        _offsetY =
                            _calculateOffset(dragDetails.primaryDelta, context);
                      });
                    },
                    onHeaderTapped: () {
                      debugPrint("onHeaderTapped");
                      setState(() {
                        this._expandedState =
                            this._expandedState == ExpandedState.compact
                                ? ExpandedState.expanded
                                : ExpandedState.compact;
                      });
                    },
                  ),
                )),
          ],
        ));
  }
}

class LeftMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      child: Container(
        width: 200.0,
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 1.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    title: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  LeftMenuTile(
                    icon: Icon(
                      IconData(0xe491, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                    ),
                    title: 'My Profile',
                    onTap: () {},
                  ),
                  LeftMenuTile(
                    icon: Icon(
                      Icons.people,
                      color: Colors.white,
                    ),
                    title: 'Explore',
                    onTap: () {},
                  ),
                  LeftMenuTile(
                    icon: Icon(
                      Icons.phone_in_talk,
                      color: Colors.white,
                    ),
                    title: 'Consult',
                    onTap: () {},
                  ),
                  LeftMenuTile(
                    icon: Icon(
                      IconData(0xe11b, fontFamily: 'MaterialIcons'),
                      color: Colors.white,
                    ),
                    title: 'About us',
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LeftMenuTile extends StatelessWidget {
  const LeftMenuTile({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final void Function()? onTap;
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          child: ListTile(
            leading: icon,
            title: Text(
              title,
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Icon(
        Icons.more_horiz,
        color: Colors.white,
        size: 40.0,
      ),
    );
  }
}
