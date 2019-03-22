import 'package:flutter/material.dart';
import 'package:flutter_veggroot/src/model/item_model.dart';

class ItemWidget extends StatefulWidget {
  final List<ItemModel> list;

  ItemWidget(this.list);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<ItemModel> fruitsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fruitsList = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fruitsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  fruitsList[index].itemImage,
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      fruitsList[index].itemName,
                      style: TextStyle(color: Colors.black, fontSize: 17.0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      priceText(fruitsList[index].marketPrice.toString(),
                          fruitsList[index].unit.toString()),
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(priceText(fruitsList[index].cost.toString(),
                            fruitsList[index].unit.toString())),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              offPercent(fruitsList[index].cost,
                                  fruitsList[index].marketPrice),
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    RaisedButton(
                      disabledColor: Colors.white,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.green[300], width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: null,
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.green[300]),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  String priceText(String price, String unit) {
    return "Rs $price/$unit ";
  }

  String offPercent(double cost, double marketPrice) {
    double offPercent;
    offPercent = (((marketPrice - cost) / marketPrice) * 100);
    return "${offPercent.toString()}% off";
  }
}
