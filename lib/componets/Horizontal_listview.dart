import 'package:flutter/material.dart';


class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
Category(
  image_location: 'images/png/cap.png',
  image_caption: 'Chapeaux',

),
          Category(
            image_location: 'images/png/shoe.png',
            image_caption: 'Chaussures',

          ),
          Category(
            image_location: 'images/png/suit.png',
            image_caption: 'Costumes',

          ),
        ],
      ),
    );
}


}

class Category extends StatelessWidget {

  final String image_location;
  final String image_caption;

  Category({
    this.image_caption,
    this.image_location
  });



  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
    width: 100.0,
    child: ListTile(
      title: Image.asset(image_location,
      width : 100.0,
      height:80.0,),
      subtitle: Container(
        alignment: Alignment.topCenter,
        child: Text(image_caption),
      ),
    ),
    ),
    ),);
  }
}
