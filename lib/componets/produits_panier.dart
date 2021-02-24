import 'package:flutter/material.dart';
class Produits_panier extends StatefulWidget {
  @override
  _Produits_panierState createState() => _Produits_panierState();
}

class _Produits_panierState extends State<Produits_panier> {
  var Produit_du_panier=[

    { "name":"Costume Freeium",
      "picture":"images/produits/6.jpg",
      "price": 120,
      "size":"M",
      "color":"Red",
      "quantity":15,

    },
    { "name":"Costume premium",
      "picture":"images/produits/7.jpg",
      "price": 120,
      "size":"M",
      "color":"Yellow",
      "quantity":12,


    },


  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Produit_du_panier.length,
      itemBuilder: (context,index){
        return Produit_panier_seul(
            panier_prod_name:Produit_du_panier[index]["name"],
          panier_prod_color:Produit_du_panier[index]["color"],
          panier_prod_qty:Produit_du_panier[index]["quantity"],
          panier_prod_size:Produit_du_panier[index]["size"],
          panier_prod_price:Produit_du_panier[index]["price"],
          panier_prod_picture:Produit_du_panier[index]["picture"],


        );
      }
    );
  }
}
class  Produit_panier_seul extends StatelessWidget {
  final panier_prod_name;
  final panier_prod_picture;
  final panier_prod_price;
  final panier_prod_color;
  final panier_prod_size;
  final panier_prod_qty;

   Produit_panier_seul({ this.panier_prod_name,
     this.panier_prod_picture,
     this.panier_prod_price,
     this.panier_prod_color,
     this.panier_prod_size,
     this.panier_prod_qty}) ;


  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
        title:new Text(panier_prod_name),
        subtitle:new Column(
          children:<Widget>[
            // ROW INSIDE THE COLUMN
        new Row(
        children:<Widget>[
            Expanded(
              child:new Text("Size:"),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(5.0, 5.0, 12.0, 5.0),
            child:new Text(panier_prod_size),
            ),

            Expanded(child: new Text("Color:"),


            ),
          ],
    ),
        ]),
      ),
    );
  }
}

