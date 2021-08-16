import 'dart:convert';

class ObjetoRastreio {
  String? codigo;
  String? servico;
  List<Historico> historico = [];

  ObjetoRastreio(String json) {
    Map<String, dynamic> mapa = jsonDecode(json);
    this.codigo = mapa["codigo"];
    this.servico = mapa["servico"];
    var list = mapa["historico"] as List;
    this.historico = [];
    for (Map<String, dynamic> item in list) {
      this.historico.add(Historico(item));
    }
  }

  @override
  String toString() {
    return 'ObjetoRastreio{codigo: $codigo, servico: $servico, historico: $historico}';
  }
}

class Historico {
  String? data;
  String? local;
  String? detalhes;
  String? situacao;

  Historico(Map<String, dynamic> mapa) {
    this.data = mapa["data"];
    this.local = mapa["local"];
    this.detalhes = mapa["detalhes"];
    this.situacao = mapa["situacao"];
  }

  @override
  String toString() {
    return 'Historico{data: $data, local: $local, detalhes: $detalhes, situacao: $situacao}';
  }
}
