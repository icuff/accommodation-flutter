import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'models/accommodation.dart';
import 'widgets/accommodation_detail.dart';

class AccommodationDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'API with Flutter',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AccommodationDetailScreen(title: 'API with Flutter'),
  );
}

class AccommodationDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  AccommodationDetailScreen({Key key, this.title, this.id}) : super(key: key);

  @override
  _AccommodationDetailsScreenState createState() => _AccommodationDetailsScreenState(id);
}

class _AccommodationDetailsScreenState extends State<AccommodationDetailScreen> {
  Accommodation _accommodation;
  List<dynamic> urls;
  final int id;

  _AccommodationDetailsScreenState(this.id);

  @override
  void initState() {
    super.initState();
    getAccommodation();
  }

  void getAccommodation() async {
    String url = 'http://acomodacao-tcc.herokuapp.com/api/v1/acomodacoes/' + id.toString();
    Response response = await get(url);

    Map<String, dynamic> map = json.decode(response.body);

    setState(() {
      _accommodation = Accommodation.fromJSON(map['acomodacao']);
      urls = map['urls'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
          child: Column(
            children: <Widget>[
              AccommodationDetail(_accommodation),
              Column(
                children: images(),
              )
            ],
          ),
      ),
    );
  }

  List<Image> images() {
    return urls.map((url) => Image.network(url)).toList();
  }
}
