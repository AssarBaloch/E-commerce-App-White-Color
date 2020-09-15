import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/cart_product.dart';
import 'package:food_app/model/order.dart';
import 'package:food_app/model/product_item_model.dart';
import 'package:food_app/model/user.dart';

class MyProvider with ChangeNotifier {
//>>>>>>>>>>>>  Cart Product <<<<<<<<<<<<<<<<<<
  CartProduct cartProduct;
  List<CartProduct> _cartProductList = [];

  void addCartProduct(
      {String cartImage,
      int cartQuantity,
      String cartName,
      double cartPrice,
      String cartColor}) {
    cartProduct = CartProduct(
      cartName: cartName,
      cartImage: cartImage,
      cartPrice: cartPrice,
      cartQuantity: cartQuantity,
      cartColor: cartColor,
    );
    _cartProductList.add(cartProduct);
  }

  List<CartProduct> get allCartProductList {
    return List.from(_cartProductList);
  }

  int get allCartProduct {
    return _cartProductList.length;
  }

  List<CartProduct> get allCartProducts {
    return _cartProductList;
  }

  getTotalCount() {
    double total = 0.0;
    _cartProductList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

  // int inindex;
  // void deleteIndex(int index) {
  //   inindex = index;
  // }
  void delete(int index) {
    _cartProductList.removeAt(index);

    notifyListeners();
  }

///////////// Product ///////////////////

  ProductItemModel productItem;
  List<ProductItemModel> _productList = [];

  fetchAllProduct() async {
    List<ProductItemModel> newList = [];
    QuerySnapshot allProduct =
        await FirebaseFirestore.instance.collection('Product').get();
    allProduct.docs.forEach(
      (snapShot) {
        productItem = ProductItemModel(
          productName: snapShot.data()['ProductName'],
          productImage: snapShot.data()['ProductImage'],
          productPrice: snapShot.data()['ProductPrice'],
        );
        newList.add(productItem);
      },
    );
    _productList = newList;
  }

  get getAllProductsList {
    return _productList;
  }

///////// Users ////////////////

  Users _users;
  User currentUser = FirebaseAuth.instance.currentUser;

  fetchUserData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Users').get();
    snapshot.docs.forEach(
      (checkDocument) {
        if (currentUser.uid == checkDocument.data()["userId"]) {
          _users = Users(
            userImage: checkDocument.data()["userImage"],
            email: checkDocument.data()['userEmail'],
            fullName: checkDocument.data()["userName"],
            password: checkDocument.data()["userPassword"],
          );
        }
      },
    );
  }

  get getCurrrentUser {
    return _users ??
        Users(email: '', fullName: '', password: '', userImage: '');
  }

//>>>>> Start Categroy >>>>>>>>>>???<<<<<<

//>>>>>>>>>>>>Water Cooler <<<<<<<<<<<<<<
  ProductItemModel earplugCategoryList;
  List<ProductItemModel> _earplugCategoryList = [];

  fetchAllEarplugCategoryList() async {
    List<ProductItemModel> newEarplugCategoryList = [];
    QuerySnapshot allEarplugCategoryList = await FirebaseFirestore.instance
        .collection('CategoryList')
        .doc('bpK2y91wVTx4UxT1PbCF')
        .collection('Watercooler')
        .get();
    allEarplugCategoryList.docs.forEach(
      (snapShot) {
        earplugCategoryList = ProductItemModel(
          productName: snapShot.data()['WatercoolerCategoryListName'],
          productImage: snapShot.data()['WatercoolerCategoryListImage'],
          productPrice: snapShot.data()['WatercoolerCategoryListPrice'],
        );
        newEarplugCategoryList.add(earplugCategoryList);
      },
    );
    _earplugCategoryList = newEarplugCategoryList;
  }

  get getAllEarplugCategoryList {
    return _earplugCategoryList;
  }

  //>>>>>>>>>>> Bluetooth<<<<<<<<<<<<<<

  ProductItemModel bluetoothCategoryList;
  List<ProductItemModel> _bluetoothCategoryList = [];

  fetchAllBluetoothCategoryList() async {
    List<ProductItemModel> newbluetoothCategoryList = [];
    QuerySnapshot allBluetoothCategoryList = await FirebaseFirestore.instance
        .collection('CategoryList')
        .doc('bpK2y91wVTx4UxT1PbCF')
        .collection('Pc')
        .get();
    allBluetoothCategoryList.docs.forEach(
      (snapShot) {
        bluetoothCategoryList = ProductItemModel(
          productName: snapShot.data()['PcCategoryListName'],
          productImage: snapShot.data()['PcCategoryListImage'],
          productPrice: snapShot.data()['PcCategoryListPrice'],
        );
        newbluetoothCategoryList.add(bluetoothCategoryList);
      },
    );
    _bluetoothCategoryList = newbluetoothCategoryList;
  }

  get getAllBluetoothCategoryList {
    return _bluetoothCategoryList;
  }

  //<<<<<<<<<<<<<<<<< Laptop <<<<<<<<<<<<<<<

  ProductItemModel laptopCategoryList;
  List<ProductItemModel> _laptopCategoryList = [];

  fetchAllLaptopCategoryList() async {
    List<ProductItemModel> newLaptopCategoryList = [];
    QuerySnapshot allLaptopCategoryList = await FirebaseFirestore.instance
        .collection('CategoryList')
        .doc('bpK2y91wVTx4UxT1PbCF')
        .collection('Laptop')
        .get();
    allLaptopCategoryList.docs.forEach(
      (snapShot) {
        laptopCategoryList = ProductItemModel(
          productName: snapShot.data()['LaptopCategoryListName'],
          productImage: snapShot.data()['LaptopCategoryListImage'],
          productPrice: snapShot.data()['LaptopCategoryListPrice'],
        );
        newLaptopCategoryList.add(laptopCategoryList);
      },
    );
    _laptopCategoryList = newLaptopCategoryList;
  }

  get getAllLaptopCategoryList {
    return _laptopCategoryList;
  }

  //<<<<<<<<<<<<<<<<< DrslCamara  <<<<<<<<<<<<<<<
  ProductItemModel drslCamaraCategoryList;
  List<ProductItemModel> _drslCamaraCategoryList = [];

  fetchAllDrslCamaraCategoryList() async {
    List<ProductItemModel> newDrslCamaraCategoryList = [];
    QuerySnapshot allDrslCamaraCategoryList = await FirebaseFirestore.instance
        .collection('CategoryList')
        .doc('bpK2y91wVTx4UxT1PbCF')
        .collection('DrslCamara')
        .get();
    allDrslCamaraCategoryList.docs.forEach(
      (snapShot) {
        drslCamaraCategoryList = ProductItemModel(
          productName: snapShot.data()['DrslCamaraCategoryListName'],
          productImage: snapShot.data()['DrslCamaraCategoryListImage'],
          productPrice: snapShot.data()['DrslCamaraCategoryListPrice'],
        );
        newDrslCamaraCategoryList.add(drslCamaraCategoryList);
      },
    );
    _drslCamaraCategoryList = newDrslCamaraCategoryList;
  }

  get getAllDrslCamaraCategoryList {
    return _drslCamaraCategoryList;
  }

///////////// Search Bar ///////////////////////

  List<ProductItemModel> searchList;
  void getSearchList({List<ProductItemModel> list}) {
    searchList = list;
  }

  List<ProductItemModel> productSearch(String query) {
    List<ProductItemModel> searchFood = searchList.where((element) {
      return element.productName.toLowerCase().contains(query) ||
          element.productName.toUpperCase().contains(query);
    }).toList();
    return searchFood;
  }

  List<Order> _order = [];
  List<Order> get orders {
    return [..._order];
  }

  Future<void> addOrder(
      List<CartProduct> cartProducts, double orderTotal) async {
    final timeDate = DateTime.now();
    try {
      await FirebaseFirestore.instance.collection('Order').doc().set(
        {
          'id': DateTime.now().toString(),
          'amount': orderTotal,
          'dateTime': timeDate.toIso8601String(),
          'userImage': _users.userImage,
          'userName': _users.fullName,
          'userEmail': _users.email,
          'userId': currentUser.uid,
          'OrderProduct': cartProducts
              .map(
                (e) => {
                  'OrderName': e.cartName,
                  'OrderImage': e.cartImage,
                  'OrderPrice': e.cartPrice,
                  'OrderTotalPrice': orderTotal,
                  'OrderQuantuty': e.cartQuantity,
                },
              )
              .toList(),
        },
      );
      _order.insert(
        0,
        Order(
          orderDateTime: timeDate,
          orderId: DateTime.now().toString(),
          orderProduct: cartProducts,
          orderTotal: orderTotal,
        ),
      );
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  get counter {
    int count = 0;
    return count++;
  }
}
