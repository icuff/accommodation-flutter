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