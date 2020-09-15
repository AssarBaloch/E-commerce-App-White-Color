import 'package:flutter/material.dart';
import 'package:food_app/model/product_item_model.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:food_app/screen/detail_screen.dart';
import 'package:food_app/widgets/scound_part.dart';
import 'package:provider/provider.dart';

class CategorySearch extends SearchDelegate<ProductItemModel> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(
            context,
            null,
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    List<ProductItemModel> _searchProduct = provider.productSearch(query);
    return Container(
      color: Colors.black87,
      child: GridView.count(
        padding: EdgeInsets.only(left: 17),
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          children: _searchProduct.map<Widget>(
            (e) {
              return ScoundPart(
                productImage: e.productImage??'',
                productName: e.productName,
                productPrice: e.productPrice,
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                    ),
                  );
                },
              );
            },
          ).toList()),
    );
  }
 
  @override
  Widget buildSuggestions(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    List<ProductItemModel> _searchProduct = provider.productSearch(query);
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black87,
      child: GridView.count(
        childAspectRatio: 0.70,
        crossAxisCount: 2,
        children: _searchProduct.map<Widget>(
          (e) {
            return ScoundPart(
              productImage: e.productImage??'',
              productName: e.productName,
              productPrice: e.productPrice,
              whenPrassed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
