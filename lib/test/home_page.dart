import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:food_app/test/Detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedUsState = "Connecticut";
  List<String> usStates = <String>[
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
  ];

  Widget singalProduct(
      {String productName,
      String productSubtitleName,
      Color color,
      String productImage,
      Function whenPressed}) {
    return InkWell(
      onTap: whenPressed,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: const EdgeInsets.only(
          left: 20,
          top: 25,
        ),
        height: 230,
        width: 155,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(productImage),
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              productSubtitleName,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Network',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              FlatButton(
                onPressed: () {
                  showMaterialScrollPicker(
                    cancelText: 'Close',
                    confirmText: 'Ok',
                    backgroundColor: Colors.white,
                    headerColor: Colors.white,
                    buttonTextColor: Colors.blue,
                    onConfirmed: () {
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.red,
                      );
                    },
                    showDivider: false,
                    context: context,
                    items: usStates,
                  );
                },
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Anthem',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Blue Cross',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget callingSingalProduct() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          singalProduct(
              productName: 'Schedule a',
              productSubtitleName: 'Cleaning',
              color: Color(0xff9cd5ff),
              productImage: 'images/tooth1.png',
              whenPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      productImage: 'images/tooth1.png',
                      productName: 'Schedule a',
                      productSubtitle: 'Cleaning',
                      productColor: Color(0xff9cd5ff),
                    ),
                  ),
                );
              }),
          singalProduct(
              productName: 'Learn abount',
              productSubtitleName: 'Proceedures',
              color: Color(0xff9eb5ff),
              productImage: 'images/doctorA.png',
              whenPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      productImage: 'images/doctorA.png',
                      productName: 'Learn abount',
                      productSubtitle: 'Proceedures',
                      productColor: Color(0xff9eb5ff),
                    ),
                  ),
                );
              }),
          singalProduct(
              productName: 'Proper',
              productSubtitleName: 'Cleaning',
              color: Color(0xffff9baf),
              productImage: 'images/Grils.png',
              whenPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      productImage: 'images/Grils.png',
                      productName: 'Proper',
                      productSubtitle: 'Cleaning',
                      productColor: Color(0xffff9baf),
                    ),
                  ),
                );
              }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget circleContainer({String name}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: Color(
                    0xff65a8f9,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        backgroundColor: Color(0xf8f8f8),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(),
            callingSingalProduct(),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    'My Dentist',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(
                    0xfff3f2f1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('images/map.jpg'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('images/Dr.jpg'),
                          radius: 25,
                        ),
                        title: Text('Dr.Burnham DDS'),
                        subtitle: Text('Family dentist,Orthodontics'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
              ),
              child: Row(
                children: [
                  circleContainer(name: 'Call'),
                  circleContainer(name: 'MESSAGE'),
                  circleContainer(name: 'DIRECTIONS'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
