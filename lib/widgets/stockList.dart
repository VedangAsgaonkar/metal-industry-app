
import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}
class _StockListState extends State<StockList>{

  List<Stock> stocks=Stock.getAll();
  String stockName="";
  List<bool> isSelected=<bool>[true,false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text("Metal",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            Expanded(
              flex: 8,
              child: ToggleButtons(
                children: <Widget>[
                  Text("Shaizi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("CC",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (Stock stock in stocks) {
                      stock.priceChange(index);
                    }
                    for (int buttonIndex = 0; buttonIndex <
                        isSelected.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
                fillColor: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
                flex:2,
                child: SizedBox(width:30)),
            Expanded(
              flex: 5,
              child: Text("LME",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
                flex:4,
                child:SizedBox(),
            ),
          ],
        ),
        Expanded(
          flex:1,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap:true,
              physics: BouncingScrollPhysics(parent:AlwaysScrollableScrollPhysics()),
              separatorBuilder: (context, index) {
              return Divider(color: Colors.grey[400]);
            },
            itemCount: this.stocks.length,
            itemBuilder: (context, index) {

              Stock stock = this.stocks[index];

              return ExpansionTile(
                children: <Widget>[
                  Column(
                    children: _buildExpandableContent(stock,context,stockName),
                  )
                ],
                title: Row(
                  children: <Widget>[
                    Expanded(
                      flex:8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("${stock.symbol}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                          Text("${stock.metal}",style: TextStyle(color: Colors.grey[500], fontSize: 20))
                        ],
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex:6,
                      child: Column(
                        children: <Widget>[
                          Text("\$${stock.priceDisplay}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red
                              ),
                              width: 75,
                              height: 25,
                              child: Text("-1.09%",style: TextStyle(color: Colors.white))
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex:5,
                      child: Column(
                        children: <Widget>[
                          Text("\$${stock.priceLME}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red
                              ),
                              width: 75,
                              height: 25,
                              child: Text("-1.09%",style: TextStyle(color: Colors.white))
                            )
                          ],
                        ),
                    ),
                    ],
                  ),
                );
            }
          ),
        ),
    ],
    );
  }
  _buildExpandableContent(Stock stock, BuildContext context, String stockName)
  {
    List<Widget> widgets= <Widget>[];
    widgets.add(
      GestureDetector(
        onTap:(){
          stockName = stock.metal;
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.all((Radius.circular(20.0))),
          ),
          child: Text(
              stock.metal,
              style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)
          ),
        ),
      ),
    );
    return widgets;

  }
}