import 'package:flutter/material.dart';
import 'package:food_app/model/cart_product.dart';

class Order {
  final String orderId;
  final List<CartProduct> orderProduct;
  final double orderTotal;
  final DateTime orderDateTime;

  Order({
    @required this.orderDateTime,
    @required this.orderId,
    @required this.orderProduct,
    @required this.orderTotal,
  });
}
