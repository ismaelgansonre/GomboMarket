import 'dart:ui';

import 'package:flutter/material.dart';
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

bottomNavigationBar: new Container(
  color: Colors.white,
  child: Row(
    children: <Widget>[
      Expanded(child: ListTile(title:new Text("Total"),
      subtitle: new Text("\$780"),
      )),
      Expanded(
        child: new MaterialButton(onPressed: (){},
          child:new Text("Check out",style :TextStyle(color: Colors.white), ),
          color:Colors.red,),
      )
    ],
  )
),

    );
  }
}
