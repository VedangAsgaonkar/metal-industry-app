import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';
import 'package:stockclone/widgets/newsList.dart';
import 'package:stockclone/widgets/stockList.dart';
import 'dart:core';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

List<FlSpot> getDataFlList(List<double> x, List<double> y) {
  List<FlSpot> outlist = [];
  for (int i = 0; i < x.length; i++) {
    outlist.add(FlSpot(x[i], y[i]));
  }
  return outlist;
}

bool isIncreasingTrend(List<double> y) {
  if (y[y.length - 1] > y[y.length - 2]) {
    return true;
  } else {
    return false;
  }
}

List<Color> graphColors(List<double> y) {
  if (isIncreasingTrend(y)) {
    return [Colors.lightBlue.withOpacity(0.5), Colors.green.withOpacity(0.5)];
  } else {
    return [Colors.orange.withOpacity(0.5), Colors.red.withOpacity(0.5)];
  }
}

List<Color> lineColors(List<double> y) {
  if (isIncreasingTrend(y)) {
    return [Colors.green];
  } else {
    return [Colors.red];
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _offsetY = 100;
  ExpandedState _expandedState = ExpandedState.compact;
  String stockName = "";
  late Stock curr_stock = Stock.getAll()[0];
  List<double> x = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  List<double> y = [3,1,5,6,5,3,2,5,8,10,13,14,16,24,12,11,10,18,19,20];
  int num_disp = 20;
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        curr_stock.metal,
                        style: TextStyle(
                            color: Colors.grey[50],
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 250.0,
                        child: Expanded(
                          child: LineChart(
                            LineChartData(
                              borderData: FlBorderData(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                )
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  spots: getDataFlList(curr_stock.time_list.sublist(curr_stock.time_list.length-num_disp),curr_stock.price_list.sublist(curr_stock.price_list.length -num_disp)),
                                  colors: lineColors(curr_stock.price_list.sublist(curr_stock.price_list.length -num_disp)),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: graphColors(curr_stock.price_list.sublist(curr_stock.price_list.length -num_disp)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CupertinoSlidingSegmentedControl<int>(
                        backgroundColor: Colors.grey[700]!,
                        thumbColor: Colors.white,
                        children: <int,Widget>{
                          5: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 22.0
                            ),
                          ),
                          10: Text(
                            '10',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 22.0
                            ),
                          ),
                          15: Text(
                            '15',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 22.0
                            ),
                          ),
                          20: Text(
                            '20',
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 22.0
                            ),
                          ),
                        },
                        onValueChanged: (value){
                          setState(() {
                            num_disp = value!;
                          });
                        },
                        groupValue: num_disp,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                        ),
                        width: 300.0,
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            child: DropdownButton(
                              items: locations.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
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
                              dropdownColor: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 260,
                      child: StockList(
                        currentLocation,
                        (stock) {
                          setState(() {
                            curr_stock = stock;
                          });
                        },
                      ),
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
