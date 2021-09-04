class Stock {
  String symbol = "";
  String metal = "";
  double priceShaizi = 0;
  double priceCc = 0;
  double priceLME = 0;
  double priceMCX = 0;
  double priceDisplayLocal = 0;
  double priceDisplayMain = 0;

  Stock(String symbol, String metal, double priceShaizi, double priceCc,
      double priceLME, double priceMCX) {
    this.symbol = symbol;
    this.metal = metal;
    this.priceShaizi = priceShaizi;
    this.priceDisplayLocal = priceShaizi;
    this.priceCc = priceCc;
    this.priceLME = priceLME;
    this.priceMCX = priceMCX;
    this.priceDisplayMain = priceLME;
  }

  static List<Stock> getAll() {
    List<Stock> stocks = <Stock>[];
    stocks.add(Stock("Lead", "Pb", 258, 100, 50, 100));
    stocks.add(Stock("Copper", "Cu", 800, 200, 50, 10000));
    stocks.add(Stock("General Electronic", "GE", 56.00, 10, 50, 10000));
    stocks.add(Stock("Home Depot", "HE", 10, 178, 50, 10000));
    stocks.add(Stock("Evergreen Solar", "EVR", 10, 9.0, 50, 10000));
    stocks.add(Stock("Facebook", "FB", 10, 200, 50, 10000));
    stocks.add(Stock("Samsung", "SAM", 10, 134, 50, 10000));
    stocks.add(Stock("Snapchat", "SNAP", 10, 45, 50, 10000));
    stocks.add(Stock("Microsoft", "MSOFT", 10, 400, 50, 10000));
    stocks.add(Stock("Google", "GOOG", 10, 1800, 50, 10000));

    return stocks;
  }

  void priceChangeLocal(int? co) {
    if (co == 1) {
      priceDisplayLocal = priceCc;
    } else {
      priceDisplayLocal = priceShaizi;
    }
  }

  void priceChangeMain(int? co) {
    if (co == 1) {
      priceDisplayMain = priceMCX;
    } else {
      priceDisplayMain = priceLME;
    }
  }
}
