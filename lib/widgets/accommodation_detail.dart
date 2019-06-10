import 'package:flutter/material.dart';
import '../models/accommodation.dart';

class AccommodationDetail extends StatelessWidget {
  final Accommodation _accommodation;
  AccommodationDetail(this._accommodation);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Text(
        _accommodation.titulo,
        style: TextStyle(fontSize: 34.0),
      ),
      Text(_accommodation.tipoString()),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Capacidade: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_accommodation.capacidade.toString())
            ],
          ),
          Row(
            children: <Widget>[
              Text('Preço: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_accommodation.preco.toString())
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
              Text(_accommodation.logradouro)
            ],
          ),
          Row(
            children: <Widget>[
              Text('Número: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_accommodation.numero)
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
              Text(_accommodation.complemento)
            ],
          ),
          Row(
            children: <Widget>[
              Text('Bairro: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_accommodation.bairro)
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
              Text(_accommodation.cidade)
            ],
          ),
          Row(
            children: <Widget>[
              Text('Estado: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(_accommodation.estado)
            ],
          )
        ],
      ),
      Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold)),
      Text(_accommodation.descricao),
    ],
  );
}