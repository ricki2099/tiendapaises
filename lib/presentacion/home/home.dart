import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproductos/data/remote/pais_api.dart';
import 'package:testproductos/data/remote/product_api.dart';
import 'package:testproductos/presentacion/widgets/paises_card.dart';
import 'package:testproductos/presentacion/widgets/products_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading;
  var productsList;
  var paisesList;

  void getProduct() async {
    ProductApi products = ProductApi();
    await products.getProducts();
    productsList = products.products;
    setState(() {
      _loading = false;
    });
  }

  void getPaises() async {
    PaisApi paises = PaisApi();
    await paises.getPais();
    paisesList = paises.paises;
    setState(() {
      _loading = false;
    });
  }

  void initState() {
    _loading = true;
    super.initState();
    getProduct();
    getPaises();
    _loading = false;
  }

  final titleTextStyle = TextStyle(
    // fontFamily: "Lato",
    fontSize: 25,
    fontWeight: FontWeight.w900,
  );

  // final titlePais = Column(
  //   crossAxisAlignment: CrossAxisAlignment.start,
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.all(6),
  //       child: Text(
  //         "Paises",
  //         style: TextStyle(
  //           // fontFamily: "Lato",
  //           fontSize: 25,
  //           fontWeight: FontWeight.w900,
  //         ),
  //       ),
  //     ),
  //   ],
  // );
  @override
  Widget build(BuildContext context) {
    // String pathImage = "assets/images/cargando.jpg";

    final contenido = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Tienda',
          style: TextStyle(
            fontFamily: "Lato",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          // child: Image.asset(
          //   ICon,
          //   height: 50,
          //   width: 50,
          //   // add custom icons also
          // ),
        ),
      ),
      body: (_loading = false)
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tienda Pepito',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductsCard(
                            // urlImage: charactersList[index].urlImage ?? "",
                            nameProduct: productsList[index].nameProduct ?? "",
                            barcode: productsList[index].barcode ?? "",
                            marca: productsList[index].marca ?? "",
                            precio: productsList[index].precio ?? "",
                            sku: productsList[index].sku ?? "",
                            descripcion: productsList[index].descripcion ?? "",
                            urlImage: productsList[index].urlImage ?? "",
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Paises',
                      style: titleTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: paisesList?.length ?? 0,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PaisesCard(
                            Code: paisesList[index].Code ?? "",
                            Urlimage: paisesList[index].Urlimage ?? "",
                            name: paisesList[index].name ?? "",
                            id: paisesList[index].id ?? "",
                            Symbol: paisesList[index].Symbol ?? "",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );

    return SafeArea(child: contenido);
  }
}
