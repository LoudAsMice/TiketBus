import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("DASHBOARD"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.amber[100],
      body: Container(
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
        Card(
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, size: 70.0),
                  Text("Home", style: new TextStyle(fontSize: 17.0))
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }
}
