//    var list = json['fnblist'] as List;
//    print(list);
//    List<Fruits> fNBList = list.map((i) => Fruits.fromJson(i)).toList();

class ItemModel {
  double cost;
  int itemId;
  String itemImage;
  String itemName;
  double marketPrice;
  String unit;

  ItemModel(
      {this.cost,
      this.itemId,
      this.itemImage,
      this.itemName,
      this.marketPrice,
      this.unit});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        cost: json['cost'].toDouble(),
        itemId: json['itemId']as int,
        itemImage: json['itemImage'],
        itemName: json['itemName'],
        marketPrice: json['marketPrice'].toDouble(),
        unit: json['unit']);
}
