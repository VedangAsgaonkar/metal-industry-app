import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';
import 'package:stockclone/widgets/newsList.dart';
import 'package:stockclone/widgets/stockList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _offsetY = 100;
  ExpandedState _expandedState = ExpandedState.compact;
  String stockName = "";

  double _calculateOffset(delta, context) {

    final maxHeight = MediaQuery.of(context).size.height - 100;
    final newOffset = _offsetY + (delta) * (-1);
    if (newOffset <= 100) {
      return 100;
    } else if(newOffset >= maxHeight) {
      return maxHeight;
    } else {
      return newOffset;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: ClipRRect(
          borderRadius:BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
          child: Container(
            width: 350.0,
            child: Drawer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        stockName,
                        style : TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
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
                      Text("Stocks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      Text("December 3",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: "Search",
                                prefix: Icon(Icons.search),
                                fillColor: Colors.grey[800],
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, style: BorderStyle.none),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                                filled: true),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 310,
                        child: StockList(stocks: Stock.getAll(), stockName: stockName,),
                      )
                    ]),
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
                        _offsetY = _calculateOffset(dragDetails.primaryDelta, context);
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
                ))
          ],
        ));
  }
}
