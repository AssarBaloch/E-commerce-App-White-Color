import 'package:flutter/material.dart';
import 'package:food_app/model/product_item_model.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:food_app/screen/category_search.dart';
import 'package:food_app/screen/detail_screen.dart';
import 'package:food_app/screen/product_search.dart';
import 'package:food_app/widgets/scound_part.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final List<ProductItemModel> list;
  CategoryScreen({this.list});
  bool isCategory = false;

  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: [
          isCategory == true
              ? 
          IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    myProvider.getSearchList(list: list);
                    showSearch(context: context, delegate: CategorySearch());
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    myProvider.getSearchList(list: list);
                    showSearch(context: context, delegate: ProductSearch());
                  },
               ),
        ],
        elevation: 0.0,
      ),
      body: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 15),
          crossAxisCount: 2,
          childAspectRatio: 6.5 / 10.0,
          crossAxisSpacing: 10,
          children: list.map(
            (e) {
              return ScoundPart(
                productImage: e.productImage,
                productName: e.productName,
                productPrice: e.productPrice,
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        productImage: e.productImage,
                        productName: e.productName,
                        productPrice: e.productPrice,
                      ),
                    ),
                  );
                },
              );
            },
          ).toList()),
    );
  }
}
