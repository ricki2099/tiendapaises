import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproductos/domain/entities/pais.dart';

class PaisApi {
  List<Pais> paises = [];

  Future<void> getPais() async {
    String url =
        "https://5u2d6uxvfc.execute-api.us-east-2.amazonaws.com/Etapa-Pruebas";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    // print(jsonData['data']['Items']);
    jsonData['data']['Items'].forEach((element) {
      if (element['id'] != null) {
        Pais pais = Pais(
          Code: element['Code'],
          Urlimage: element['Urlimage'],
          id: element['id'],
          name: element['name'],
          Symbol: element['Symbol'],
        );
        paises.add(pais);
        // print(products);
      }
    });
  }
}
