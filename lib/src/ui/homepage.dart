import 'package:flutter/material.dart';
import 'package:flutter_veggroot/src/ui/fruitsScreen.dart';
import 'package:flutter_veggroot/src/ui/vegetable_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Drawer(),
        appBar: AppBar(
            title: Text("VeggFarm"),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                new Tab(text: "Fruits"),
                new Tab(text: "Vegetables"),
              ],
            )),
        body: TabBarView(
            controller: _tabController,
            children: <Widget>[FruitsScreen(), VegetableScreen()]));
  }
}
