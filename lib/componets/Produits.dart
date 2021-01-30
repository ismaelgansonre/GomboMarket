import 'package:flutter/material.dart';
class  Produits extends StatefulWidget {
  @override
  _ProduitsState createState() => _ProduitsState();
}



class _ProduitsState extends State<Produits> {
  var list_produits=[
    { "name":"Costume Vlisco 1",
      "picture":"images/produits/1.jpg",
      "old_price": 120.000,
      "price":95.000,
    },
    { "name":"Costume Vlisco 2",
      "picture":"images/produits/2.jpg",
      "old_price": 130.000,
      "price":90.000,
    },
    { "name":"Costume Vlisco 3",
      "picture":"images/produits/3.jpg",
      "old_price": 140.000,
      "price":99.000,
    }
  };
]
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list_produits.length,
        gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount: 2) ,
        itemBuilder:(BuildContext context, int index)
    {
    return Single_produit(
    prod_name: list_produits[index]['name'],
    prod_picture:list_produits[index]['picture'] ,
    prod_old_price:list_produits[index]['old_price'] ,
    prod_price: list_produits[index]['price'],
    );
    });
  }
}
class Single_produit extends StatefulWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

   Single_produit({Key key, this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price}) ;

  @override
  _Single_produitState createState() => _Single_produitState();
}

class _Single_produitState extends State<Single_produit> {
  @override
  Widget build(BuildContext context) {
    return Card (
      child: Hero(tag: prod_name,
        child: Material
          (child: InkWell(
          onTap: (){},
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(
                  prod_name,
                  style: TextStyle(fontWeight: FontWeight.bold),

                ),
                title:  Text(
                    "\$$prod_price",
                    style:TextStyle(
                      color: Colors.red, fontWeight: FontWeight.w800),
                    ),
              ),

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
