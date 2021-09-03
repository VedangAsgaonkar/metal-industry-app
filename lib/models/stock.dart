
class Stock {

  String symbol="";
  String metal="";
  double priceShaizi=0;
  double priceCc=0;
  double priceLME=0;
  double priceDisplay=0;
  int co=0;

  Stock(String symbol, String metal, double priceShaizi,double priceCc, double priceLME){
    this.symbol=symbol;
    this.metal=metal;
    this.priceShaizi=priceShaizi;
    this.priceDisplay=priceShaizi;
    this.priceCc=priceCc;
    this.priceLME=priceLME;
    this.co=0;
  }

  static List<Stock> getAll() {

    List<Stock> stocks = <Stock>[];
    stocks.add(Stock("Lead", "Pb", 258, 100,50));
    stocks.add(Stock("Copper","Cu", 800, 200,50));
    stocks.add(Stock( "General Electronic", "GE", 56.00,10,50));
    stocks.add(Stock( "Home Depot", "HE",  10, 178,50));
    stocks.add(Stock("Evergreen Solar", "EVR",10,  9.0,50));
    stocks.add(Stock("Facebook", "FB", 10, 200,50));
    stocks.add(Stock("Samsung", "SAM", 10,  134,50));
    stocks.add(Stock("Snapchat", "SNAP", 10, 45,50));
    stocks.add(Stock("Microsoft", "MSOFT",10, 400,50));
    stocks.add(Stock("Google", "GOOG",10, 1800,50));

    return stocks;

  }

  void priceChange(int co){
    if(co==1){
      priceDisplay=priceCc;
    }else{
      priceDisplay=priceShaizi;
    }
  }

}