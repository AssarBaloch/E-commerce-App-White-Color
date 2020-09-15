import 'package:flutter/cupertino.dart';

class ProductItemModel {
  final String productImage;
  final String productName;
  final double productPrice;
  ProductItemModel({
    @required this.productName,
    @required this.productImage,
    @required this.productPrice,
  });
}
