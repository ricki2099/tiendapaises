import 'package:flutter/material.dart';

class PaisesCard extends StatelessWidget {
  PaisesCard({
    @required this.id,
    this.Urlimage,
    this.Code,
    this.name,
    this.Symbol,
  });
  final String id, Urlimage, Code, name, Symbol;

  @override
  Widget build(BuildContext context) {
    final cardImage = Container(
      height: 150,
      width: 200,
      margin: EdgeInsets.only(
        top: 0,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Urlimage),
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
      top: 80,
      left: 10.0,
      right: 10.0,
      child: Card(
        elevation: .0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                name + " - " + Symbol,
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
                "Codigo: " + Code,
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
                "Identificador: " + id,
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
