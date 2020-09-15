import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productSubtitle;
  final Color productColor;

  DetailPage(
      {this.productColor,
      this.productImage,
      this.productName,
      this.productSubtitle});

  Widget circleContainer(
      {String name, Color color, Color textColor, FontWeight fontWeight}) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(color: textColor, fontWeight: fontWeight),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateAndTime({IconData iconData, String date, String dateDetaile}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0xffedf7ff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(iconData),
              ),
            ],
          ),
          title: Text(date),
          subtitle: Text(dateDetaile),
        ),
      ),
    );
  }

  Widget dateAndTimeCalling() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date & Time',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          dateAndTime(
            date: 'Date',
            dateDetaile: 'August 29th 2019',
            iconData: Icons.date_range,
          ),
          dateAndTime(
            date: 'Time',
            dateDetaile: '9:00AM',
            iconData: Icons.access_time,
          ),
        ],
      ),
    );
  }

  Widget myCoverage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Coverage',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          dateAndTime(
            date: 'lncluded',
            dateDetaile: 'X-ray',
            iconData: Icons.offline_bolt,
          ),
          dateAndTime(
            date: 'lncluded',
            dateDetaile: 'Polishing',
            iconData: Icons.move_to_inbox,
          ),
        ],
      ),
    );
  }

  Widget row() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      width: 230,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          circleContainer(
              name: 'PHILLIP',
              textColor: Colors.white,
              color: Color(0xff82caff),
              fontWeight: FontWeight.bold),
          SizedBox(
            width: 10,
          ),
          circleContainer(
              name: 'KIMBERLY',
              textColor: Colors.black38,
              color: Color(0xfff8f8f8),
              fontWeight: FontWeight.w100),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        child: RaisedButton(
          color: productColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          onPressed: () {},
          child: Text('Done'),
        ),
      ),
      backgroundColor: productColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: productColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: productColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          productSubtitle,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    row(),
                    dateAndTimeCalling(),
                    myCoverage(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
