import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/category.dart';
import 'package:food_app/model/product_item_model.dart';

class CategoryProvider with ChangeNotifier {
  /////////EarPlug CateGory <<<<<<<<<<<<
  Category earplugCategory;
  List<Category> _earplugCategoryList = [];

  fetchAllEarplugCategory() async {
    List<Category> newEarplugListCategory = [];
    QuerySnapshot allProduct = await FirebaseFirestore.instance
        .collection('Category')
        .doc('4hFOC8UaBXMwUd4vLrwp')
        .collection('WaterCooler')
        .get();
    allProduct.docs.forEach(
      (snapShot) {
        earplugCategory = Category(
          categoryImage: snapShot.data()['WaterCoolCategoryImage'],
        categoryName:  snapShot.data()['WaterCoolCategoryName'],
        );
        newEarplugListCategory.add(earplugCategory);
      },
    );
    _earplugCategoryList = newEarplugListCategory;
     notifyListeners();
  }


  get getAllEarplugCategoryList {
    return _earplugCategoryList;
  }

//>>>>>>>>>  Bluetooth Category <<<<<<<<<<
  Category bluetoothCategory;
  List<Category> _bluetoothCategoryList = [];

  fetchAllBluetoothCategory() async {
    List<Category> newBluetoothListCategory = [];
    QuerySnapshot allBluetoothProduct = await FirebaseFirestore.instance
        .collection('Category')
        .doc('4hFOC8UaBXMwUd4vLrwp')
        .collection('Pc')
        .get();
    allBluetoothProduct.docs.forEach(
      (snapShot) {
        bluetoothCategory = Category(
          categoryImage: snapShot.data()['PcCategoryImage'],
          categoryName: snapShot.data()['PcCategoryName'],
        );
        newBluetoothListCategory.add(bluetoothCategory);
      },
    );
    _bluetoothCategoryList = newBluetoothListCategory;
     notifyListeners();
  }

  get getAllBluetoothCategoryList {
    return _bluetoothCategoryList;
  }
  //<<<<<<<<<<< Laptop Category <<<<<<<<<<
   Category laptopCategory;
  List<Category> _laptopCategoryList = [];

  fetchAllLaptopCategory() async {
    List<Category> newlaptopListCategory = [];
    QuerySnapshot allLaptopProduct = await FirebaseFirestore.instance
        .collection('Category')
        .doc('4hFOC8UaBXMwUd4vLrwp')
        .collection('Laptop')
        .get();
    allLaptopProduct.docs.forEach(
      (snapShot) {
        laptopCategory = Category(

          categoryImage: snapShot.data()['LaptopCategoryImage'],
        categoryName: snapShot.data()['LaptopCategoryName'],
        );
        newlaptopListCategory.add(laptopCategory);
      },
    );
    _laptopCategoryList = newlaptopListCategory;
     notifyListeners();
  }

  get getAllLaptopCategoryList {
    return _laptopCategoryList;
  }

  //<<<<<<<<<<<< DrslCamara Category <<<<<<<<<<<<
     Category drslCamaraCategory;
  List<Category> _drslCamaraCategoryList = [];
fetchAllDrslCamaraCategory() async {
    List<Category> newDrslCamaraListCategory = [];
    QuerySnapshot allDrslCamaraProduct = await FirebaseFirestore.instance
        .collection('Category').doc('4hFOC8UaBXMwUd4vLrwp').collection('Drslcamara').get();
       
    allDrslCamaraProduct.docs.forEach(
      (snapShot) {
        drslCamaraCategory = Category(
          categoryImage: snapShot.data()['DrslcamaCategoryImage'],
          categoryName: snapShot.data()['DrslcamaCategoryName'],
        );
        newDrslCamaraListCategory.add(drslCamaraCategory);
      },
    );
    _drslCamaraCategoryList = newDrslCamaraListCategory;
    notifyListeners();
  }

  get getAllDrslCamaraCategoryList {
    return _drslCamaraCategoryList;
  }


//////////////// Search Bar ////////////////////////


  List<ProductItemModel> searchList;
  void searchLists({List<ProductItemModel> list}) {
    searchList = list;
  }

  List<ProductItemModel> categorySearch(String query) {
    List<ProductItemModel> searchFood = searchList.where((element) {
      return element.productName.toLowerCase().contains(query)|| element.productName.toUpperCase().contains(query);
    }).toList();
    return searchFood;
  }

}
