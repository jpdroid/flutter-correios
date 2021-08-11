import 'dart:convert';

class ResultadoCEP {
  String? bairro;
  String? cidade;
  String? logradouro;
  String? estado;
  EstadoInfo? estadoInfo;
  CidadeInfo? cidadeInfo;

  ResultadoCEP(String json, bool viaCep) {
    Map<String, dynamic> mapa = jsonDecode(json);
    this.bairro = mapa["bairro"];
    this.cidade = mapa["cidade"];
    this.logradouro = mapa["logradouro"];
    this.estado = viaCep ? mapa["uf"] : mapa["estado"];

    this.estadoInfo = EstadoInfo(mapa["estado_info"]);
    this.cidadeInfo = CidadeInfo(mapa["cidade_info"]);
  }
}

class EstadoInfo {
  String? areaKm2;
  String? codigoIBGE;
  String? nome;
  EstadoInfo(Map<String, dynamic> mapa) {
    this.areaKm2 = mapa["area_km2"];
    this.codigoIBGE = mapa["codigo_ibge"];
    this.nome = mapa["nome"];
  }
}

class CidadeInfo {
  String? areaKm2;
  String? codigoIBGE;

  CidadeInfo(Map<String, dynamic> mapa) {
    this.areaKm2 = mapa["area_km2"];
    this.codigoIBGE = mapa["codigo_ibge"];
  }
}
