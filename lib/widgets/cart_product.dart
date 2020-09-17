import 'package:flutter/material.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:provider/provider.dart';

class CardProducts extends StatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  final String productColor;
  int productQuantity;
  CardProducts({
    this.productColor,
    this.productPrice,
    this.productName,
    this.productImage,
    this.productQuantity,
  });

  @override
  _CardProductsState createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  Widget fristRow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.productName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          '\$${widget.productPrice.floorToDouble() * widget.productQuantity}',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          '${widget.productColor}',
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget addAndRemove() {
    return Container(
      height: 115,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: add,
          ),
          Text(widget.productQuantity.toString()),
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: minus,
          ),
        ],
      ),
    );
  }

  MyProvider myProvider;

  void add() {
    setState(() {
      widget.productQuantity++;
    });
  }

  void minus() {
    setState(() {
      if (widget.productQuantity != 1) widget.productQuantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          color: Theme.of(context).accentColor,
          height: 120,
          margin: EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 15,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 120,
                    child: Image.network(widget.productImage),
                  ),
                  fristRow(),
                ],
              ),
              addAndRemove(),
            ],
          ),
        ),
        // addAndRemove(),
      ],
    );
  }
}
