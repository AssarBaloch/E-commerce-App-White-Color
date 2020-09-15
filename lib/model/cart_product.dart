import 'package:flutter/material.dart';

class CartProduct {
  final String cartImage;
  final int cartQuantity;
  final String cartName;
  final double cartPrice;
  final String cartColor;
  CartProduct(
      {@required this.cartName,
      @required this.cartImage,
      @required this.cartColor,
      @required this.cartPrice,
      @required this.cartQuantity});
}
