import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/produits_details.dart';
class  Produits extends StatefulWidget {
  @override
  _ProduitsState createState() => _ProduitsState();
}



class _ProduitsState extends State<Produits> {
  var list_produits=[
    { "name":"Costume Vlisco 1",
      "picture":"images/produits/1.jpg",
      "old_price": 120,
      "price":95,
    },

    { "name":"Costume Vlisco 2",
      "picture":"images/produits/2.jpg",
      "old_price": 140,
      "price":99,
    },
    { "name":"Costume Vlisco 3",
      "picture":"images/produits/3.jpg",
      "old_price": 120,
      "price":95,
    },
    { "name":"Costume Vlisco 4",
      "picture":"images/produits/4.jpg",
      "old_price": 120,
      "price":95,
    },
    { "name":"Costume Vlisco 5",
      "picture":"images/produits/5.jpg",
      "old_price": 120,
      "price":95,
    },
    { "name":"Costume Vlisco 6",
      "picture":"images/produits/6.jpg",
      "old_price": 120,
      "price":95,
    },
    { "name":"Costume Vlisco 7",
      "picture":"images/produits/7.jpg",
      "old_price": 120,
      "price":95,
    },


];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list_produits.length,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2) ,
        itemBuilder:(BuildContext context, int index)
    {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Single_produit(
      prod_name: list_produits[index]['name'],
      prod_picture:list_produits[index]['picture'] ,
      prod_old_price:list_produits[index]['old_price'] ,
      prod_price: list_produits[index]['price'],
      ),
    );
    });
  }
}
class Single_produit extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_produit({
    this.prod_name,
    this.prod_old_price,
    this.prod_picture,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Hero(
        tag: new Text("hero 1"),
          child: Material
            (child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductsDetails(
              //Nous apssons les valeurs des produits vers les details des produits
              produit_detail_nom:prod_name ,
            produit_detail_new_price: prod_price,
            produit_detail_old_price: prod_old_price,
            produit_detail_picture: prod_picture,))),
            child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: new Row(children: <Widget>[
                    Expanded(child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                    ),
                    new Text ("\$${prod_price}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                  ],)
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                )),
          ),

          )),
     );

  }
}