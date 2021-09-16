import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';

class StockList extends StatefulWidget {
  String? location;
  final List<Stock> stocks = Stock.getAll();
  void Function(Stock)? setStock ;
  StockList(this.location,this.setStock) {
    for (Stock stock in stocks) {
      stock.priceChangeLocation(this.location);
    }
  }
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  String stockName = "";
  int? controlLocal = 0;
  int? controlMain = 0;

  Widget changeTitle() {
    if (this.widget.location == 'North') {
      return CupertinoSlidingSegmentedControl(
        children: <int, Widget>{
          0: Text(
            "Shaizi",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          1: Text(
            "CC",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        },
        onValueChanged: (int? i) {
          setState(() {
            controlLocal = i;
            for (Stock stock in this.widget.stocks) {
              stock.priceChangeLocal(controlLocal);
            }
          });
        },
        groupValue: controlLocal,
        //isSelected: isSelected,
        //fillColor: Colors.grey[900],
        //borderRadius: BorderRadius.circular(10),
      );
    } else if (this.widget.location == 'West') {
      return Text(
        "Local (CC)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        "Local",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /*for (Stock stock in stocks) {
      stock.priceChangeLocation(this.widget.location);
    }*/

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(
                "Metal",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Expanded(
              flex: 8,
              child: changeTitle(),
            ),
            Expanded(flex: 2, child: SizedBox(width: 30)),
            Expanded(
              flex: 7,
              child: CupertinoSlidingSegmentedControl(
                children: <int, Widget>{
                  0: Text(
                    "LME",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  1: Text(
                    "MCX",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                },
                onValueChanged: (int? i) {
                  setState(() {
                    controlMain = i;
                    for (Stock stock in this.widget.stocks) {
                      stock.priceChangeMain(controlMain);
                    }
                  });
                },
                groupValue: controlMain,
                //isSelected: isSelected,
                //fillColor: Colors.grey[900],
                //borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            Text(
              "Last Update",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Divider(
          height: 5.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Expanded(
          flex: 1,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              separatorBuilder: (context, index) {
                return Divider(color: Colors.grey[400]);
              },
              itemCount: this.widget.stocks.length,
              itemBuilder: (context, index) {
                Stock stock = this.widget.stocks[index];
                return ListTileTheme(
                  contentPadding: EdgeInsets.all(0),
                  child: ExpansionTile(
                    children: <Widget>[
                      Column(
                        children:
                            _buildExpandableContent(stock, context, widget.setStock),
                      )
                    ],
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${stock.symbol}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("${stock.metal}",
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 20))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: <Widget>[
                              Text("\$${stock.priceDisplayLocal}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:stock.metal.compareTo("Pb") == 0 ?  Colors.greenAccent[400]: Colors.red,),
                                  width: 75,
                                  height: 25,
                                  child: Text( stock.metal.compareTo("Pb") == 0 ? "+2.50%" :"-1.09%",
                                      style: TextStyle(color: Colors.white)))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: <Widget>[
                              Text("\$${stock.priceDisplayMain}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: stock.metal.compareTo("Pb") == 0 ? Colors.greenAccent[400] : Colors.red,),
                                  width: 75,
                                  height: 25,
                                  child: Text( stock.metal.compareTo("Pb") == 0 ? "+2.50%" :"-1.09%",
                                      style: TextStyle(color: Colors.white)))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  _buildExpandableContent(Stock stock, BuildContext context, void Function(Stock)? setStock) {
    List<Widget> widgets = <Widget>[];
    widgets.add(
      Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.all((Radius.circular(20.0))),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text(stock.metal,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w500)),
                GestureDetector(
                  onTap: () {
                    setStock!(stock);
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Icon(
                      Icons.auto_graph,
                      size: 35,
                      color: Colors.tealAccent,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.white);
                  },
                  itemCount: stock.variety_cost.length,
                  itemBuilder: (context, index) {

                    return ListTileTheme(
                      contentPadding: EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          title: Text(
                              stock.variety_name[index],
                              style: TextStyle(
                                color: Colors.grey[50],
                                fontSize: 20.0,
                              ),
                          ),
                          trailing: Text(
                            stock.variety_cost[index].toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
    return widgets;
  }
}


