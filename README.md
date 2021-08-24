# flutter_correios

Fazer o rastreio de objetos enviados pelos CORREIOS e consultar CEP.
Este pacote utiliza a API [POSTMON](https://postmon.com.br/)



## Usage

```dart
  dependencies:
     flutter:
        sdk: flutter
     flutter_correios:
```     




### Como rastrear um objeto

```dart
   
    // import 'package:flutter_correios/flutter_correios.dart';
    // import 'package:flutter_correios/model/objeto_rastreio.dart';
    
    
    final FlutterCorreios fc = FlutterCorreios();
    ObjetoRastreio objeto = await fc.fazerRastreio(codRastreio: "PT118988786BR");
    print("código do rastreio: ${objeto.codigo}");
    print("Serviço: ${objeto.servico}");
    for(Historico historico in objeto.historico){
      print("=>");
      print("   Data:"+historico.data);
      print("   Local:"+historico.local);
      print("   Situação:"+historico.situacao);
      print("   Detalhes:"+historico.detalhes);
      print("<=");
    }    
```


### Como consultar um CEP

```dart
   
    // import 'package:flutter_correios/flutter_correios.dart';
    // import 'package:flutter_correios/model/resultado_cep.dart';
    
    
    final FlutterCorreios fc = FlutterCorreios();
    ResultadoCEP resultado = await fc.consultarCEP(cep: "72010010");
    print("bairro: ${resultado.bairro}");
    print("cidade: ${resultado.cidade}");
    print("estado: ${resultado.estado}");
    print("logradouro: ${resultado.logradouro}");
    print("   Estado Km2: ${resultado.estadoInfo.areaKm2}");
    print("   Estado IBGE: ${resultado.estadoInfo.codigoIBGE}");
    print("   Estado Nome: ${resultado.estadoInfo.nome}");
    print("   Cidade Km2: ${resultado.cidadeInfo.areaKm2}");
    print("   Cidade IBGE: ${resultado.cidadeInfo.codigoIBGE}");
```
## by CALL
