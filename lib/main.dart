import 'package:flutter/material.dart';
import 'lib.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'componets/Horizontal_listview.dart';
//le programme commence ici
void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
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
Widget image_carousel=new Container(
 height: 200.0,
  child: new Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('images/C.jpeg'),
      AssetImage('images/D.jpeg'),
      AssetImage('images/E.jpeg'),

    ],
    autoplay: false,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(microseconds: 100),

  ),
);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.lightGreen,
        title: Text('GomboMarket'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){})


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
                leading: Icon(Icons.home),
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mon Compte'),
                leading: Icon(Icons.person),
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes Commandes'),
                leading: Icon(Icons.shopping_basket),
              ),

            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Catalogue'),
                leading: Icon(Icons.dashboard),
              ),

            ), InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favoris'),
                leading: Icon(Icons.favorite),
              ),

            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Parametres'),
                leading: Icon(Icons.settings, color: Colors.purple,),
              ),

            ),
           InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('A Propos'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),

            ),
          ],
        )
      ),
      body: new ListView(
        children:<Widget> [
          //image carousel begins here
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),),

          // Horizontal List view started here
          HorizontalList(),


        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}