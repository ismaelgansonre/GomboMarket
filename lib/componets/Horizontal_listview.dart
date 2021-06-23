import 'package:flutter/material.dart';
import 'package:flutter_ecom/pages/produits_details.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Category(
  image_location: 'images/png/cap.png',
  image_caption: 'Chapeaux',

),
          Category(
            image_location: 'images/png/shoe.png',
            image_caption: 'Botte',

          ),
          Category(
            image_location: 'images/png/suit.png',
            image_caption: 'Costumes',

          ),
          Category(
            image_location: 'images/png/dress.png',
            image_caption: 'Robes',

          ),
          Category(
            image_location: 'images/png/watch.png',
            image_caption: 'Montres',

          ),
          Category(
            image_location: 'images/png/pants.png',
            image_caption: 'Pants',

          ),

        ],
      ),
    );
}


}

class Category extends StatelessWidget {

  // ignore: non_constant_identifier_names
  final String image_location;
  // ignore: non_constant_identifier_names
  final String image_caption;

  Category({
    // ignore: non_constant_identifier_names
    this.image_caption,
    // ignore: non_constant_identifier_names
    this.image_location
  });



  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: ()
    => Navigator.of(context).push(new MaterialPageRoute(builder:(context) => new ProductsDetails())),
    child: Container(
    width: 80.0,
    child: ListTile(
      title: Image.asset(image_location,
      width : 100.0,
      height:80.0,),
      subtitle: Container(
        alignment: Alignment.topCenter,
        child: Text(image_caption,style: new TextStyle(fontSize: 9.0),),
      ),
    ),
    ),
    ),);
  }
}
