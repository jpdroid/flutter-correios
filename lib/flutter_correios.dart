library flutter_correios;

import 'package:flutter_correios/model/objeto_rastreio.dart';
import 'package:flutter_correios/model/resultado_cep.dart';
import 'package:http/http.dart' as http;

/// FlutterCorreios.
class FlutterCorreios {
  /// Returna a consulta do cep [cep].
  /// A pesquisa será feita usando a api VIACEP, 
  ///   caso [postmon] seja true ele também pesquisará usando a api do POSTMON.
  Future<ResultadoCEP?> consultarCEP({required String cep, bool postmon=false}) async {
    ResultadoCEP? retorno;

    retorno = await _viaCep(cep: cep);

    if (retorno == null && postmon==true) {
      retorno = await _postmon(cep: cep);
    }

    return retorno;
  }

  Future<ResultadoCEP?> _postmon({required String cep}) async {
    ResultadoCEP? retorno;
    try {
      final response = await http.get(
          Uri.parse("https://api.postmon.com.br/v1/cep/$cep"),
          headers: {"Content-Type": "text/json; charset=utf-8"});
      if (response.statusCode == 200) {
        retorno = ResultadoCEP(response.body, false);
      } else {
        print("Erro na requisição postmon");
      }
      return retorno;
    } catch (e) {
      print(e);
    }
    return retorno;
  }

  Future<ResultadoCEP?> _viaCep({required String cep}) async {
    ResultadoCEP? retorno;
    try {
      final response = await http.get(
          Uri.parse("https://viacep.com.br/ws/$cep/json"),
          headers: {"Content-Type": "text/json; charset=utf-8"});
      if (response.statusCode == 200) {
        retorno = ResultadoCEP(response.body, true);
      } else {
        print("Erro na requisição via cep");
      }
      return retorno;
    } catch (e) {
      print(e);
    }
    return retorno;
  }

  /// Returna o andamento do rastreio.
  Future<ObjetoRastreio?> fazerRastreio({required String codRastreio}) async {
    ObjetoRastreio? retorno;
    try {
      final response = await http.get(
          Uri.parse("https://api.postmon.com.br/v1/rastreio/ect/$codRastreio"),
          headers: {"Content-Type": "text/json; charset=utf-8"});
      if (response.statusCode == 200) {
        retorno = ObjetoRastreio(response.body);
      } else {
        print("Erro na requisição");
      }
      return retorno;
    } catch (e) {
      print(e);
    }
    return retorno;
  }
}
