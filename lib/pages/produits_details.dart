import 'package:flutter/material.dart';
class ProductsDetails extends StatefulWidget {
  final produit_detail_nom;
  final produit_detail_new_price;
  final produit_detail_old_price;
  final produit_detail_picture;

   ProductsDetails({ this.produit_detail_nom, this.produit_detail_new_price, this.produit_detail_old_price, this.produit_detail_picture}) ;
  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        title: Text('GomboMarket'),
        actions: <Widget>[
          new IconButton(
              icon: Icon
                (Icons.search,
                color: Colors.white,
              ), onPressed: ()
          {}),
          new IconButton(icon: Icon
            (Icons.shopping_cart,
            color: Colors.white,
          ), onPressed: ()
          {})


        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.produit_detail_picture),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(widget.produit_detail_nom),
                  title:  new Row(
                    children: <Widget>[
                      Expanded (child: new Text("${widget.produit_detail_old_price}"),
                      ),
                      Expanded (child: new Text("${widget.produit_detail_new_price}")),
                    ],
                  ),
                ),
              ),
            ),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
