import 'package:flutter/material.dart';
import '../models/accommodation.dart';
import '../accommodation_details.dart';

class AccommodationTile extends StatelessWidget {
  final Accommodation _accommodation;
  AccommodationTile(this._accommodation);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_accommodation.titulo),
      ),
      Row(
        children: [
          Text('Capacity: ' + _accommodation.capacidade.toString()),
          Text('Price: ' + _accommodation.preco.toString())
        ],
      ),
      RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AccommodationDetailScreen(id: _accommodation.id)
            )
          );
        },
        child: Text('Details'),
      ),
      Divider()
    ],
  );
}