import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  ProductsCard({
    @required this.nameProduct,
    @required this.barcode,
    @required this.sku,
    this.marca,
    this.precio,
    this.descripcion,
    this.urlImage,
  });
  final String nameProduct, barcode, sku, marca, descripcion, urlImage;
  final int precio;

  @override
  Widget build(BuildContext context) {
    final cardImage = Container(
      height: 200,
      width: 200,
      margin: EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );
    final data = Positioned(
      bottom: 0,
      left: 10.0,
      right: 10.0,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                nameProduct,
                style: TextStyle(
                  // fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Codigo: " + barcode,
                style: TextStyle(
                  // fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                descripcion,
                style: TextStyle(
                  // fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                "Precio \$" + precio.toString(),
                style: TextStyle(
                  // fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Stack(
      children: [cardImage, data],
    );
  }
}
