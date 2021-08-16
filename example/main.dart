import 'package:flutter_correios/flutter_correios.dart';
import 'package:flutter_correios/model/objeto_rastreio.dart';
import 'package:flutter_correios/model/resultado_cep.dart';

void main() async {
  final FlutterCorreios fc = FlutterCorreios();

  //consultar cep
  ResultadoCEP? resultado = await fc.consultarCEP(cep: "71950904");
  print("bairro: ${resultado?.bairro ?? ''}");
  print("cidade: ${resultado?.cidade ?? ''}");
  print("estado: ${resultado?.estado ?? ''}");
  print("logradouro: ${resultado?.logradouro ?? ''}");
  print("   Estado Km2: ${resultado?.estadoInfo?.areaKm2 ?? ''}");
  print("   Estado IBGE: ${resultado?.estadoInfo?.codigoIBGE ?? ''}");
  print("   Estado Nome: ${resultado?.estadoInfo?.nome ?? ''}");
  print("   Cidade Km2: ${resultado?.cidadeInfo?.areaKm2 ?? ''}");
  print("   Cidade IBGE: ${resultado?.cidadeInfo?.codigoIBGE ?? ''}");

  //rastreiar um objeto
  ObjetoRastreio? objeto = await fc.fazerRastreio(codRastreio: "QG390647726BR");
  print("código do rastreio: ${objeto?.codigo ?? ''}");
  print("Serviço: ${objeto?.servico ?? ''}");
  for (Historico historico in (objeto?.historico ?? [])) {
    print("=>");
    print("   Data:" + (historico.data ?? ''));
    print("   Local:" + (historico.local ?? ''));
    print("   Situação:" + (historico.situacao ?? ''));
    print("   Detalhes:" + (historico.detalhes ?? ''));
    print("<=");
  }
}
