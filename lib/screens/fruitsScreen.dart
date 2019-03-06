import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_veggroot/model/item_model.dart';
import 'package:flutter_veggroot/screens/item_screen/item_widget.dart';
import 'package:http/http.dart' as http;

class FruitsScreen extends StatefulWidget {
  FruitsScreen({Key key}) : super(key: key);

  @override
  _FruitsScreenState createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen>
    with AutomaticKeepAliveClientMixin<FruitsScreen> {
  List<ItemModel> fruitsList;

  Future<List<ItemModel>> getData() async {
    String link;
    link =
        "https://raw.githubusercontent.com/ashishrawat2911/BUSJSON/master/veggItem.json";

    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["fruits"] as List;
      print(rest.length);
      fruitsList = List<ItemModel>.from(rest.map((x) => ItemModel.fromJson(x)));
      print(fruitsList);
    }

    print("List Size: ${fruitsList.length}");
    return fruitsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: getData(), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<ItemModel>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return ItemWidget(fruitsList);
        }
      },
    );
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
