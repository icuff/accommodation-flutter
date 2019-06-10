import 'package:flutter/material.dart';

import 'models/accommodation.dart';

class AccommodationDetailScreen extends StatelessWidget {
  final Accommodation accommodation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              accommodation.titulo,
              style: TextStyle(fontSize: 34.0),
            ),
            Text(accommodation.tipoString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Capacidade: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.capacidade.toString())
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Preço: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.preco.toString())
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Logradouro: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.logradouro)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Número: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.numero)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Complemento: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.complemento)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Bairro: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.bairro)
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Cidade: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.cidade)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(accommodation.estado)
                  ],
                )
              ],
            ),
            Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(accommodation.descricao)
          ],
        )
      ),
    );
  }

  AccommodationDetailScreen({Key key, this.accommodation}) : super(key: key);
}
