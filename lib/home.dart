import 'package:flutter/material.dart';
import 'accommodations_list.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Beers'),
      ),
      body: RaisedButton(
        onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccommodationsListApp())
            );
        },
        child: Text('Get Accommodations'),
      ),
    );
  }
}
