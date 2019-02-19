# flutter_correios

Fazer o rastreio de objetos enviados pelo CORREIOS.

## Getting Started

Este projeto criado para suprir a necessidade de consultar rastreio de objetos
enviados pelo Correios, também é possível consultar um CEP.


## Usage

Para usar o plugin:
```yaml
  dependencies:
     flutter:
        sdk: flutter
     flutter_correios:
```     




## How to use

```yaml
   
    //import 'package:flutter_correios/flutter_correios.dart';
    //import 'package:flutter_correios/model/objeto_rastreio.dart';
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
