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
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.produit_detail_nom,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  title:  new Row(
                    children: <Widget>[
                      Expanded (child: new Text("\$${widget.produit_detail_old_price}",
                      style:TextStyle(color:Colors.grey,decoration: TextDecoration.lineThrough),),
                      ),
                      Expanded (child: new Text("\$${widget.produit_detail_new_price}", style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),)),
                    ],
                  ),
                ),
              ),
            ),
            color: Colors.black,
          ),

          //=================== Premier Boutton===============
          Row(
            children: <Widget>[
              //===========boutton taille
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                builder: (context){
                  return new AlertDialog(
                    title: new Text("Taille"),
                    content: new Text("Choisissez la taille"),
                    actions: <Widget>[
                      new MaterialButton( onPressed:(){
                        Navigator.of(context).pop(context);
                      },
                      child: new Text("Fermer"),)
                    ],
                  );
                });

              },
              color: Colors.white,
                  textColor: Colors.grey,
                elevation: 0.2,
              child: Row(
                children: <Widget>[
                  //==================================
                  Expanded(
                      child: new Text("Taille")
                  ),
                  Expanded(
                      child: new Icon(Icons.arrow_drop_down)
                  ),
                ],
              ),
              ),
              ),
              //================boutton couleur====================
              Expanded(child: MaterialButton(onPressed: (){


                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Couleur"),
                        content: new Text("Choisissez la couleur"),
                        actions: <Widget>[
                          new MaterialButton( onPressed:(){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Fermer"),)
                        ],
                      );
                    });


              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text("Couleur")
                    ),

                    Expanded(
                        child: new Icon(Icons.arrow_drop_down)
                    ),
                  ],
                ),
              ),
              ),
              //=================== boutton Qte =========================
              Expanded(child: MaterialButton(onPressed: (){

                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Qte"),
                        content: new Text("Choisissez la Qte"),
                        actions: <Widget>[
                          new MaterialButton( onPressed:(){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Fermer"),)
                        ],
                      );
                    });




              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text("Qte")
                    ),

                    Expanded(
                        child: new Icon(Icons.arrow_drop_down)
                    ),
                  ],
                ),

              ),
              ),
            ],
          ),
          // =========================deuxieme boutton ================================


          Row(
            children: <Widget>[
              //===========boutton taille
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Acheter Mintenant")
              ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,),  onPressed:(){}),
              new IconButton(icon: Icon(Icons.favorite_border), color: Colors.red, onPressed:(){}),

            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Detail du produit"),
            subtitle: new Text("S’ils voient le jour aux Pays-Bas, c’est en Afrique, où commerçants et clients leur donnent un nom, que nos dessins prennent vie. À notre connaissance, dans le monde, seuls les imprimés de la marque Vlisco sont baptisés par les clients et acquièrent une signification spéciale. C’est lorsque des histoires se tissent que les dessins Vlisco trouvent pleinement leur voix. Découvrez les noms et les histoires qui se sont rattachés à nos tissus au fil des ans."),
          ),
Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nom du produit",style:TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.produit_detail_nom),)
            ],
          ),
      new Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
            child: new Text("Nom de la marque",style:TextStyle(color: Colors.grey),),),
        //===== CREER UNE MARQUE DE VETEMENTS=======

          Padding(padding: EdgeInsets.all(5.0),
            child: new Text("VLISCO"),)

        ],
      ),
      //====CREER UNE CONDIOTION POUR LES ARTICLES
      new Row(
          children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
      child: new Text("Condition",style:TextStyle(color: Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
              child: new Text("NEUF"),)
   ],
    )
    ],
    ),
    );
}
}
