import 'dart:ui';

import 'package:flutter/material.dart';
// mes importations
import 'package:flutter_ecom/componets/produits_panier.dart';
class Panier extends StatefulWidget {
  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  //BAR DU DESSUS
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        title: Text('Panier'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),



        ],
      ),

body: new Produits_panier(),


bottomNavigationBar: new Container(
  color: Colors.white,
  child: Row(
    children: <Widget>[
      Expanded(child: ListTile(title:new Text("Total"),
      subtitle: new Text("\$780"),
      )),
      Expanded(
        child: new MaterialButton(onPressed: (){},
          child:new Text("Passer a la caisse",style :TextStyle(color: Colors.white), ),
          color:Colors.red,),
      )
    ],
  )
),

    );
  }
}
