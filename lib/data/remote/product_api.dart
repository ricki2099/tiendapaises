import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproductos/domain/entities/product.dart';

class ProductApi {
  List<Product> products = [];

  Future<void> getProducts() async {
    String url =
        "https://go2n57hqd8.execute-api.us-east-2.amazonaws.com/Etapa-PruebasProductos";
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    // print(jsonData['data']['Items']);
    jsonData['data']['Items'].forEach((element) {
      if (element['sku'] != null) {
        Product product = Product(
          barcode: element['barcode'],
          marca: element['marca'],
          nameProduct: element['nameProduct'],
          descripcion: element['descripcion'],
          precio: element['precio'],
          sku: element['sku'],
          urlImage: element['imagen'],
        );
        products.add(product);
        // print(products);
      }
    });
  }
}
