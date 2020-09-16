import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/animations/animations.dart';
import 'package:food_app/model/category.dart';
import 'package:food_app/model/product_item_model.dart';
import 'package:food_app/model/user.dart';
import 'package:food_app/provider/category.dart';
import 'package:food_app/provider/myprovider.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/carts_screen.dart';
import 'package:food_app/screen/detail_screen.dart';
import 'package:food_app/screen/profile_screen.dart';
import 'package:food_app/screen/send_mail.dart';
import 'package:food_app/widgets/notifaction.dart';
import 'package:food_app/widgets/scound_part.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  int counter;
  HomeScreen({this.counter});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyProvider myProvider;

  bool notifaction = false;

  Widget useingCarouselProPackage() {
    return Container(
      height: 200,
      width: double.infinity,
      child: Carousel(
        boxFit: BoxFit.cover,
        dotSize: 6.0,
        dotIncreasedColor: Color(0xFFFF335C),
        showIndicator: false,
        images: [
          NetworkImage(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
          ),
          NetworkImage(
            'https://deep-image.ai/extra/slider-3-b.8cdacaf4.jpg',
          ),
          NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGMf5RLsxY1VKguLz-6s6bhYUkC3xWrAmG3Q&usqp=CAU",
          ),
        ],
      ),
    );
  }

  Widget textFeild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 340,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Color(0xffefefef),
              filled: true,
              hintText: 'Search...',
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xffefefef),
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          child: Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }

  Widget categoryContainer({String image, Function whenPrassed, String name}) {
    return InkWell(
      onTap: whenPrassed,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.only(right: 20),
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: Color(0xffefefef),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget earPlugCategory(context) {
    CategoryProvider earplugCategoryProvider =
        Provider.of<CategoryProvider>(context);
    List<Category> getEarplugCategory =
        earplugCategoryProvider.getAllEarplugCategoryList;
    MyProvider myProvider = Provider.of(context);

    return Column(
      children: getEarplugCategory.map(
        (e) {
          return Row(
            children: <Widget>[
              categoryContainer(
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        list: myProvider.getAllEarplugCategoryList,
                      ),
                    ),
                  );
                },
                image: e.categoryImage,
                name: e.categoryName,
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  Widget bluetoothCategory(context) {
    CategoryProvider bluetoothCategoryProvider =
        Provider.of<CategoryProvider>(context);
    List<Category> getBluetoothCategory =
        bluetoothCategoryProvider.getAllBluetoothCategoryList;
    MyProvider myProvider = Provider.of(context);

    return Column(
      children: getBluetoothCategory.map(
        (e) {
          return Row(
            children: <Widget>[
              categoryContainer(
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        list: myProvider.getAllBluetoothCategoryList,
                      ),
                    ),
                  );
                },
                image: e.categoryImage,
                name: e.categoryName,
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  Widget laptopCategory(context) {
    CategoryProvider laptopCategoryProvider =
        Provider.of<CategoryProvider>(context);
    List<Category> getlaptopCategory =
        laptopCategoryProvider.getAllLaptopCategoryList;
    MyProvider myProvider = Provider.of(context);
    return Column(
      children: getlaptopCategory.map(
        (e) {
          return Row(
            children: <Widget>[
              categoryContainer(
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        list: myProvider.getAllLaptopCategoryList,
                      ),
                    ),
                  );
                },
                image: e.categoryImage,
                name: e.categoryName,
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  Widget drslCamaraCategory(context) {
    CategoryProvider drslCamaraCategoryProvider =
        Provider.of<CategoryProvider>(context);
    List<Category> getDrslCamaraCategory =
        drslCamaraCategoryProvider.getAllDrslCamaraCategoryList;
    MyProvider myProvider = Provider.of(context);
    return Column(
      children: getDrslCamaraCategory.map(
        (e) {
          return Row(
            children: <Widget>[
              categoryContainer(
                whenPrassed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        list: myProvider.getAllDrslCamaraCategoryList,
                      ),
                    ),
                  );
                },
                image: e.categoryImage,
                name: e.categoryName,
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  Widget categoryRow(context) {
    return FadeAnimtion(
      delay: 3,
      child: Container(
        width: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  earPlugCategory(context),
                  bluetoothCategory(context),
                  laptopCategory(context),
                  drslCamaraCategory(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget callingSecoundPart(
    context,
  ) {
    MyProvider provider = Provider.of<MyProvider>(context);
    List<ProductItemModel> extractLists = provider.getAllProductsList;
    return GridView.count(
      childAspectRatio: 1.25,
      scrollDirection: Axis.horizontal,
      // crossAxisSpacing: 20,
      crossAxisCount: 2,
      reverse: true,
      shrinkWrap: false,
      children: extractLists.map((element) {
        return ScoundPart(
          productImage: element.productImage,
          productName: element.productName,
          productPrice: element.productPrice,
          whenPrassed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  // counter: counter,
                  productImage: element.productImage,
                  productName: element.productName,
                  productPrice: element.productPrice,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget listTileDrawer(
      {Function whenPressed, String listTileName, IconData iconData}) {
    return ListTile(
      onTap: whenPressed,
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        listTileName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget userAccountsDrawerHeader({Users currentUser}) {
    return Container(
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(),
        accountEmail: Text(
          currentUser.email,
        ),
        accountName: Text(
          currentUser.fullName,
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(currentUser.userImage ??
              'https://thumbs.dreamstime.com/b/add-new-user-icon-vector-female-person-profile-avatar-plus-symbol-flat-color-glyph-pictogram-illustration-119707341.jpg'),
        ),
      ),
    );
  }

  Widget callingListtile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          listTileDrawer(
            iconData: Icons.home,
            listTileName: 'Home',
            whenPressed: () {},
          ),
          listTileDrawer(
            iconData: Icons.menu,
            listTileName: 'Shop',
            whenPressed: () {},
          ),
          ListTile(
            leading: Notifications(),
            title: Text(
              'My Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          listTileDrawer(
            iconData: Icons.person_outline,
            listTileName: 'My Account',
            whenPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          listTileDrawer(
            iconData: Icons.send,
            listTileName: 'Send Mail',
            whenPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SendMail(),
                ),
              );
            },
          ),
          listTileDrawer(
            iconData: Icons.exit_to_app,
            listTileName: 'LogOut',
            whenPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.fetchUserData();
    Users currentUser = provider.getCurrrentUser;
    provider.fetchAllProduct();
    provider.fetchAllEarplugCategoryList();
    provider.fetchAllBluetoothCategoryList();
    provider.fetchAllLaptopCategoryList();
    provider.fetchAllDrslCamaraCategoryList();
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.fetchAllEarplugCategory();
    categoryProvider.fetchAllBluetoothCategory();
    categoryProvider.fetchAllDrslCamaraCategory();
    categoryProvider.fetchAllLaptopCategory();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: <Widget>[
              userAccountsDrawerHeader(
                currentUser: currentUser,
              ),
              callingListtile(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        actions: <Widget>[
          Notifications(),
        ],
      ),
      body: FadeAnimtion(
        delay: 3,
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(
              Duration(seconds: 6),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    useingCarouselProPackage(),
                    categoryRow(context),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 560,
                      child: callingSecoundPart(
                        context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
