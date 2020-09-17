import 'package:flutter/material.dart';
import 'package:food_app/provider/myprovider.dart';

import 'package:food_app/screen/home_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final double productPrice;

  DetailScreen({
    this.productImage,
    this.productName,
    this.productPrice,
  });
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _quantity = 1;
  int counter = 1;
  List<bool> isSelected = [false, true, false, false, false];

  int indexColor = 0;
  String selectedColor;

  void add() {
    setState(() {
      _quantity++;
    });
  }

  void minus() {
    setState(() {
      if (_quantity != 1) _quantity--;
    });
  }

  void cartColor() {
    if (indexColor == 0) {
      setState(() {
        selectedColor = "black";
      });
    }
    if (indexColor == 1) {
      setState(() {
        selectedColor = "grey";
      });
    }
    if (indexColor == 2) {
      setState(() {
        selectedColor = "blue";
      });
    }
    if (indexColor == 3) {
      setState(() {
        selectedColor = "red";
      });
    }
    if (indexColor == 4) {
      setState(() {
        selectedColor = "yellow";
      });
    }
  }

  Widget topImage() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.productImage),
        ),
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget bottomPart() {
    return Expanded(
      flex: 2,
      child: Container(
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              callingFacoriteAndProductName(),
              Text(
                'Color',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              ToggleButtons(
                color: Colors.red,
                selectedColor: Colors.red,
                renderBorder: false,
                children: <Widget>[
                  circleColor(color: Colors.black),
                  circleColor(color: Colors.grey),
                  circleColor(color: Colors.blue[300]),
                  circleColor(color: Colors.red[300]),
                  circleColor(color: Colors.orange[300])
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int indexBtn = 0;
                        indexBtn < isSelected.length;
                        indexBtn++) {
                      if (indexBtn == index) {
                        isSelected[indexBtn] = !isSelected[indexBtn];
                      } else {
                        isSelected[indexBtn] = false;
                      }
                    }
                  });
                  setState(() {
                    indexColor = index;
                  });
                },
                isSelected: isSelected,
              ),
              botttomPartRow(),
              callingCartButtomAndPrice(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget botttomPartRow() {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              onPressed: minus,
              icon: Icon(
                Icons.remove,
              ),
            ),
          ),
          Text(_quantity.toString()),
          Expanded(
            child: IconButton(
              onPressed: add,
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget circleColor({Color color}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CircleAvatar(radius: 15, backgroundColor: color),
    );
  }

  Widget callingCircleColor() {
    return Row(
      children: [
        circleColor(color: Colors.black),
        circleColor(color: Colors.grey),
        circleColor(color: Colors.blue[300]),
        circleColor(color: Colors.red[300]),
        circleColor(color: Colors.orange[300])
      ],
    );
  }

  Widget addCartButtom() {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Container(
      height: 58,
      width: 290,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          cartColor();
          setState(() {
            myProvider.addNotification('assaer');
          });
          myProvider.addCartProduct(
            cartImage: widget.productImage,
            cartName: widget.productName,
            cartPrice: widget.productPrice,
            cartQuantity: _quantity,
            cartColor: selectedColor,
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                counter: counter,
              ),
            ),
          );
        },
        child: Text(
          'ADD TO CART',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget cartPrice() {
    return Text(
      '\$${_quantity * widget.productPrice.floorToDouble()}',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget callingCartButtomAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cartPrice(),
        addCartButtom(),
      ],
    );
  }

  Widget favoriteIcon() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Color(0xffefefef),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.favorite,
        color: Color(
          0xffff5e2f,
        ),
      ),
    );
  }

  Widget productName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Things ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.productName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget callingFacoriteAndProductName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        productName(),
        favoriteIcon(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Detile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            topImage(),
            bottomPart(),
          ],
        ),
      ),
    );
  }
}
