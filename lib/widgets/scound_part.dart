import 'package:flutter/material.dart';

class ScoundPart extends StatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  final Function whenPrassed;
  ScoundPart({
    this.productImage,
    this.productName,
    this.productPrice,
    this.whenPrassed,
  });

  @override
  _ScoundPartState createState() => _ScoundPartState();
}

class _ScoundPartState extends State<ScoundPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              onTap: widget.whenPrassed,
              child: Container(
                height: 210,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffefefef),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.productImage,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.productName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '\$${widget.productPrice}',
          style: TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
