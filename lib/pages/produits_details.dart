import 'package:flutter/material.dart';
import 'package:flutter_ecom/main.dart';

import 'home.dart';

class ProductsDetails extends StatefulWidget {
  final produit_detail_nom;
  final produit_detail_new_price;
  final produit_detail_old_price;
  final produit_detail_picture;

  ProductsDetails(
      {this.produit_detail_nom,
      this.produit_detail_new_price,
      this.produit_detail_old_price,
      this.produit_detail_picture});
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
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('GomboMarket')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
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
                  leading: new Text(
                    widget.produit_detail_nom,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\$${widget.produit_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                          child: new Text(
                        "\$${widget.produit_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )),
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
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Taille"),
                            content: new Text("Choisissez la taille"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Fermer"),
                              )
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
                      Expanded(child: new Text("Taille")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //================boutton couleur====================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Couleur"),
                            content: new Text("Choisissez la couleur"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Fermer"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Couleur")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //=================== boutton Qte =========================
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Qte"),
                            content: new Text("Choisissez la Qte"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Fermer"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Qte")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
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
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text("Acheter Mintenant")),
              ),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Detail du produit"),
            subtitle: new Text(
                "S’ils voient le jour aux Pays-Bas, c’est en Afrique, où commerçants et clients leur donnent un nom, que nos dessins prennent vie. À notre connaissance, dans le monde, seuls les imprimés de la marque Vlisco sont baptisés par les clients et acquièrent une signification spéciale. C’est lorsque des histoires se tissent que les dessins Vlisco trouvent pleinement leur voix. Découvrez les noms et les histoires qui se sont rattachés à nos tissus au fil des ans."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Nom du produit",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.produit_detail_nom),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Nom de la marque",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //===== CREER UNE MARQUE DE VETEMENTS=======

              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("VLISCO"),
              )
            ],
          ),
          //====CREER UNE CONDIOTION POUR LES ARTICLES
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("NEUF"),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Produits Similaire"),
          ),
// PRODUIT SIMILAIRE
          Container(
            height: 360.0,
            child: Produits_Similaire(),
          )
        ],
      ),
    );
  }
}

class Produits_Similaire extends StatefulWidget {
  @override
  _Produits_Similaire createState() => _Produits_Similaire();
}

class _Produits_Similaire extends State<Produits_Similaire> {
  var list_produits = [
    {
      "name": "Costume Vlisco 1",
      "picture": "images/produits/1.jpg",
      "old_price": 120,
      "price": 95,
    },
    {
      "name": "Costume Vlisco 6",
      "picture": "images/produits/6.jpg",
      "old_price": 120,
      "price": 95,
    },
    {
      "name": "Costume Vlisco 7",
      "picture": "images/produits/7.jpg",
      "old_price": 120,
      "price": 95,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: list_produits.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Produits_Similaire_prod(
            prod_name: list_produits[index]['name'],
            prod_picture: list_produits[index]['picture'],
            prod_old_price: list_produits[index]['old_price'],
            prod_price: list_produits[index]['price'],
          );
        });
  }
}

class Produits_Similaire_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Produits_Similaire_prod({
    this.prod_name,
    this.prod_old_price,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductsDetails(
                        //Nous apssons les valeurs des produits vers les details des produits
                        produit_detail_nom: prod_name,
                        produit_detail_new_price: prod_price,
                        produit_detail_old_price: prod_old_price,
                        produit_detail_picture: prod_picture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              prod_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          new Text(
                            "\$${prod_price}",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
