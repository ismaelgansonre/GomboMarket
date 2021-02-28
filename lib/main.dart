import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'componets/Horizontal_listview.dart';
import 'componets/Produits.dart';
import 'package:flutter_ecom/pages/panier.dart';
//le programme commence ici
void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: true,
    home:HomePage (),
      )

  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
Widget imageCarousel=new Container(
 height: 200.0,
  child: new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('images/C.jpeg'),
      AssetImage('images/D.jpeg'),
      AssetImage('images/E.jpeg'),

    ],
    autoplay: true,
  //  animationCurve: Curves.fastOutSlowIn,
   // animationDuration: Duration(microseconds: 100),
dotSize: 4.0,
    indicatorBgPadding: 2.0,
dotBgColor: Colors.transparent,
  ),
);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        title: Text('GomboMarket'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){
          }),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){ Navigator.push(context,MaterialPageRoute(builder:(context)=> new Panier()));})


        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(accountName: Text( 'OUEDRAOGO Hamidou'), accountEmail: Text ('ouedr.hamidou@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color : Colors.white) ,
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.green ),
            ),
            // Body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Accueil'),
                leading: Icon(Icons.home,color:Colors.red,),
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mon Compte'),
                leading: Icon(Icons.person,color:Colors.red,),
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes Commandes'),
                leading: Icon(Icons.shopping_basket,color:Colors.red,),
              ),

            ),
            InkWell(
              onTap: (){ Navigator.push(context,MaterialPageRoute(builder:(context)=> new Panier()));},
              child: ListTile(
                title: Text('Mon panier'),
                leading: Icon(Icons.shopping_cart,color:Colors.red,),
              ),

            ), InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favoris'),
                leading: Icon(Icons.favorite,color:Colors.red,),
              ),

            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Parametres'),
                leading: Icon(Icons.settings, ),
              ),

            ),
           InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('A Propos'),
                leading: Icon(Icons.help,),
              ),

            ),
          ],
        )
      ),
      body: new ListView(
        children:<Widget> [
          //image carousel begins here
          imageCarousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),),

          // Horizontal List view started here
          HorizontalList(),

// padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
        child: new Text('Produits Recent'),),

          //Grid view
          Container(
            height:320.0,
            child: Produits(),
          )
        ],
      ),
    );

  }
}