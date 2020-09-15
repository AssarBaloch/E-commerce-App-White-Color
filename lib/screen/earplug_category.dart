import 'package:flutter/material.dart';
import 'package:food_app/screen/detail_screen.dart';
import 'package:food_app/widgets/scound_part.dart';

class EarPlug extends StatelessWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  EarPlug({
    this.productImage,
    this.productName,
    this.productPrice,
  });
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Cetagory',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xfff5f5f5),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20),
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: orientation == Orientation.portrait ? 0.64 : 0.67,
        crossAxisSpacing: 10,
        children: <Widget>[
          ScoundPart(
            productImage:
                'http://www.pngmart.com/files/7/Ear-Plug-PNG-Transparent-Picture.png',
            productPrice: 44.99,
            productName: 'EarPlug',
            whenPrassed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    productImage:
                        'http://www.pngmart.com/files/7/Ear-Plug-PNG-Transparent-Picture.png',
                    productName: 'EarPlug',
                    productPrice: 44.99,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
