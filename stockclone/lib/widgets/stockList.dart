
import 'package:flutter/material.dart';
import 'package:stockclone/models/stock.dart';

class StockList extends StatelessWidget {

  final List<Stock> stocks;
  final String stockName;

  StockList({required this.stocks, required this.stockName});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey[400]);
        },
        itemCount: this.stocks.length,
        itemBuilder: (context, index) {

          final stock = this.stocks[index];

          return ExpansionTile(
            children: <Widget>[
              Column(
                children: _buildExpandableContent(stock,context,stockName),
              ),
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${stock.symbol}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                Text("${stock.company}",style: TextStyle(color: Colors.grey[500], fontSize: 20))
              ],
            ),
            trailing: Column(
              children: <Widget>[
                Text("\$${stock.price}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
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
            ) ,
          );
        }
    );
  }

  _buildExpandableContent(Stock stock, BuildContext context, String stockName)
  {
    List<Widget> widgets= <Widget>[];
    widgets.add(
      GestureDetector(
        onTap:(){
          stockName = stock.company;
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
            stock.company,
            style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)
          ),
        ),
      ),
    );
    return widgets;

  }
}

//
// ListTile(
// contentPadding: EdgeInsets.all(10),
// title: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text("${stock.symbol}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
// Text("${stock.company}",style: TextStyle(color: Colors.grey[500], fontSize: 20))
// ],
// ),
// trailing: Column(
// children: <Widget>[
// Text("\$${stock.price}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
// Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: Colors.red
// ),
// width: 75,
// height: 25,
// child: Text("-1.09%",style: TextStyle(color: Colors.white))
// )
// ],
// ) ,
// );
