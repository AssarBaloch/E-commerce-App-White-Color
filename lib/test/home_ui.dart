import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  Widget singalProduct({
    int number,
    String groups,
    String text,
    String image,
    String image1,
    String image2,
    Color color,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 150,
      color: Colors.white,
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'True',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          number.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0f0348),
                          ),
                        ),
                        Text(
                          'Now',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff48c2d6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 25,
                      indent: 15,
                      color: Colors.black,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          groups,
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0f0348),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2 hour massage between 4pm-6pm',
                          style:
                              TextStyle(fontSize: 17, color: Color(0xffb9c0cd)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          size: 36,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        backgroundImage: NetworkImage(image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        backgroundImage: NetworkImage(image1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        backgroundImage: NetworkImage(image2),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  child: RaisedButton(
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {},
                    child: Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xff221a5a,
                        ),
                        fontSize: 17,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfffff5f0),
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            indicatorColor: Color(0xff83d6e3),
            labelColor: Color(0xff2f2660),
            tabs: [
              Tab(
                text: "Car",
              ),
              Tab(
                text: "Transit",
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            'Blys',
            style: TextStyle(
              color: Color(0xff100249),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              backgroundColor: Color(0xfff7aa45),
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/eb/83/d1/eb83d194fd9ba8271cebe288b7af5f68.jpg',
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 11, vertical: 20),
          child: ListView(
            children: [
              Container(
                height: 120,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Special OFFER',
                                style: TextStyle(
                                  color: Color(0xff72d0df),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '2 hour massagee',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2c225e),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'package \$80',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2c225e),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://mim.org/wp-content/uploads/2017/09/event-mimkidsjuniormuseumguides.jpg',
                            ),
                          ),
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              singalProduct(
                groups: 'Office Sweedish Message',
                image1:
                    'https://i.pinimg.com/736x/d2/de/95/d2de9556e9eef282d01f208bfb8d5090.jpg',
                image2:
                    'https://www.menshairstylestoday.com/wp-content/uploads/2019/05/Cut-Boys-Hair.jpg',
                image:
                    'https://i.pinimg.com/736x/49/53/ba/4953ba42ad469ff0836e4ed2357b8cf5.jpg',
                number: 26,
                text: 'PENDING',
                color: Color(
                  0xfffcdbc8,
                ),
              ),
              singalProduct(
                groups: 'Group Sweedish Message',
                image1:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRdTsVmrhoCGnyK4I9g2ui0HaSkVbrQMDprfw&usqp=CAU',
                image2:
                    'https://www.photodoozy.com/uploads/smart-boy-pic-latest-2019.jpg',
                image:
                    'https://i.pinimg.com/474x/ab/92/a7/ab92a736239dbc2aa4a9fe875199737f.jpg',
                number: 26,
                text: 'CONFIRMED',
                color: Color(
                  0xffb9e5ec,
                ),
              ),
              singalProduct(
                groups: 'School Sweedish Message',
                image1:
                    'https://i.pinimg.com/736x/d2/de/95/d2de9556e9eef282d01f208bfb8d5090.jpg',
                image2:
                    'https://www.menshairstylestoday.com/wp-content/uploads/2019/05/Cut-Boys-Hair.jpg',
                image:
                    'https://i.pinimg.com/736x/49/53/ba/4953ba42ad469ff0836e4ed2357b8cf5.jpg',
                number: 26,
                text: 'One The Way',
                color: Color(
                  0xffd4f0cc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
