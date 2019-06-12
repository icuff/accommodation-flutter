import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

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
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  _AccommodationDetailsScreenState(this.id);

  @override
  void initState() {
    super.initState();
    DateTime begin = DateTime.now();
    getAccommodation();
    showToast(begin, DateTime.now());
  }

  void getAccommodation() async {
    String url = 'http://acomodacao-tcc.herokuapp.com/api/v1/acomodacoes/' + id.toString();
    Response response = await get(url);

    Map<String, dynamic> map = json.decode(response.body);

    setState(() {
      _accommodation = Accommodation.fromJSON(map['acomodacao']);
      urls = map['urls'];
    });
    setMarkers();
  }

  void setMarkers() {
    MarkerId position = MarkerId('position');
    final Marker origin = Marker(
      markerId: position,
      position: LatLng(_accommodation.latitude, _accommodation.longitude),
      infoWindow: InfoWindow(title: 'Accommodation', snippet: '*'),
    );
    markers[position] = origin;
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
      appBar: AppBar(title: Text('Details')),
      body:
      ListView(
        children: <Widget>[
          AccommodationDetail(_accommodation),
          Divider(),
          Container(
            height: 500.0,
            width: 350.0,
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(_accommodation.latitude, _accommodation.longitude),
//                target: LatLng(-22.89, -43.12),
                zoom: 15.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
          Divider(),
          Column(
            children: images(),
          )
        ],
      )
    );
  }

  List<Image> images() {
    return urls.map((url) => Image.network(url)).toList();
  }
}
