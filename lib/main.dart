import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'API with Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Accommodation> _accommodations = <Accommodation>[];

  @override
  void initState() {
    super.initState();
    getListAccommodations();
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

  void getAccommodation() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _accommodations.length,
        itemBuilder: (context, index) => AccommodationTile(_accommodations[index], this),
      ),
    );
  }
}

class Accommodation {
  final int id;
  final String titulo;
  final String descricao;
  final int capacidade;
  final double preco;
  final int tipo;
  final String logradouro;
  final String numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final double latitude;
  final double longitude;

  Accommodation.fromJSON(Map<String, dynamic> jsonMap) :
        id = jsonMap['id'],
        titulo = jsonMap['titulo'],
        descricao = jsonMap['descricao'],
        capacidade = jsonMap['capacidade'],
        preco = double.parse(jsonMap['preco']),
        tipo = jsonMap['tipo'],
        logradouro = jsonMap['logradouro'],
        numero = jsonMap['numero'],
        complemento = jsonMap['complemento'],
        bairro = jsonMap['bairro'],
        cidade = jsonMap['cidade'],
        estado = jsonMap['estado'],
        latitude = double.parse(jsonMap['latitude']),
        longitude = double.parse(jsonMap['longitude']);
}

class AccommodationTile extends StatelessWidget {
  final _MyHomePageState homePage;
  final Accommodation _accommodation;
  AccommodationTile(this._accommodation, this.homePage);



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
        onPressed: homePage.getAccommodation,
        child: Text('Details'),
      ),
      Divider()
    ],
  );
}
