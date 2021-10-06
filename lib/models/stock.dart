class Stock {
  String symbol = "";
  String metal = "";
  double priceShaiziNorth = 0;
  double priceCcNorth = 0;
  double priceCcWest = 0;
  double priceLocalEast = 0;
  double priceLocalSouth = 0;
  double priceLME = 0;
  double priceMCX = 0;
  double priceDisplayLocal = 0;
  double priceDisplayMain = 0;
  List<String> variety_name =[] ;
  List<double> variety_cost = [];
  List<double> time_list = [];
  List<double> price_list = [];

  Stock(
      String symbol,
      String metal,
      double priceShaiziNorth,
      double priceCcNorth,
      double priceCcWest,
      double priceLocalEast,
      double priceLocalSouth,
      double priceLME,
      double priceMCX,
      List<String> variety_name,
      List<double> variety_cost,
      List<double> time_list,
      List<double> price_list ) {
    this.symbol = symbol;
    this.metal = metal;
    this.priceShaiziNorth = priceShaiziNorth;
    this.priceDisplayLocal = priceShaiziNorth;
    this.priceCcNorth = priceCcNorth;
    this.priceLocalEast = priceLocalEast;
    this.priceLocalSouth = priceLocalSouth;
    this.priceCcWest = priceCcWest;
    this.priceLME = priceLME;
    this.priceMCX = priceMCX;
    this.priceDisplayMain = priceLME;
    this.variety_name = variety_name;
    this.variety_cost = variety_cost;
    this.price_list = price_list;
    this.time_list = time_list;
  }

  static List<Stock> getAll() {
    List<Stock> stocks = <Stock>[];
    stocks.add(Stock("Lead", "Pb", 258, 100, 50, 100, 1, 2, 3, ["Raw", "Galena"], [75.0, 80.0] , [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], [3,1,5,6,5,3,2,5,8,10,13,14,16,24,12,11,10,18,19,20]));
    stocks.add(Stock("Copper", "Cu", 800, 200, 50, 10000, 1, 2, 3 ,["Armature", "Rod", "elemental" , "brass"], [100.0,200.0,300.0,400.0] , [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], [3,1,5,6,5,3,2,5,8,10,13,14,16,24,12,11,10,9,8,6]));
    stocks.add(Stock("Aluminium", "Al", 56.00, 10, 50, 10000, 1, 2, 3 ,[], [], [] , [] ));
    stocks.add(Stock("Zinc", "Zn", 10, 178, 50, 10000, 1, 2, 3, [], [], [] , []));
    stocks.add(Stock("Nickel", "Ni", 10, 9.0, 50, 10000, 1, 2, 3 ,[], [], [] , []));
    stocks.add(Stock("Facebook", "FB", 10, 200, 50, 10000, 1, 2, 3 ,[], [], [] , []));
    stocks.add(Stock("Samsung", "SAM", 10, 134, 50, 10000, 1, 2, 3 ,[], [], [] , []));
    stocks.add(Stock("Snapchat", "SNAP", 10, 45, 50, 10000, 1, 2, 3 ,[], [], [] , []));
    stocks.add(Stock("Microsoft", "MSOFT", 10, 400, 50, 10000, 1, 2, 3, [], [], [] , []));
    stocks.add(Stock("Google", "GOOG", 10, 1800, 50, 10000, 1, 2, 3, [], [], [] , []));

    return stocks;
  }

  void priceChangeLocal(int? co) {
    if (co == 1) {
      priceDisplayLocal = priceCcNorth;
    } else {
      priceDisplayLocal = priceShaiziNorth;
    }
  }

  void priceChangeMain(int? co) {
    if (co == 1) {
      priceDisplayMain = priceMCX;
    } else {
      priceDisplayMain = priceLME;
    }
  }

  void priceChangeLocation(String? location) {
    if (location == 'North') {
      priceDisplayLocal = priceShaiziNorth;
    } else if (location == 'South') {
      priceDisplayLocal = priceLocalSouth;
    } else if (location == 'East') {
      priceDisplayLocal = priceLocalEast;
    } else {
      priceDisplayLocal = priceCcWest;
    }
  }
}
