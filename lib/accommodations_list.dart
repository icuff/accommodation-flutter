import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'models/accommodation.dart';
import 'widgets/accommodation_tile.dart';

class AccommodationsListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'API with Flutter',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AccommodationsListScreen(title: 'API with Flutter'),
  );
}

class AccommodationsListScreen extends StatefulWidget {
  AccommodationsListScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccommodationsListScreenState createState() => _AccommodationsListScreenState();
}

class _AccommodationsListScreenState extends State<AccommodationsListScreen> {
  List<Accommodation> _accommodations = <Accommodation>[];

  @override
  void initState() {
    super.initState();
    DateTime begin = DateTime.now();
    getListAccommodations();
    showToast(begin, DateTime.now());
  }

  Future<Stream<Accommodation>> getAccommodations() async {
    String url = 'http://acomodacao-tcc.herokuapp.com/api/v1/acomodacoes';

    final client = new http.Client();
    final streamedRest = await client.send(
      http.Request('get', Uri.parse(url))
    );

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => Accommodation.fromJSON(data));
  }

  void getListAccommodations() async {
    final Stream<Accommodation> stream = await getAccommodations();

    stream.listen((Accommodation accommodation) =>
        setState(() => _accommodations.add(accommodation))
    );
  }

  void showToast(DateTime begin, DateTime end) {
    String duration = end.difference(begin).inMilliseconds.toString();
    Fluttertoast.showToast(
        msg: 'Finished in ' + duration + 'ms',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _accommodations.length,
        itemBuilder: (context, index) => AccommodationTile(_accommodations[index]),
      ),
    );
  }
}
