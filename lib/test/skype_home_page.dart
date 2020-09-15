import 'package:flutter/material.dart';

class SkypeHomePage extends StatelessWidget {
  Widget listTile(
      {String userImage,
      String userName,
      String userTime,
      String userMassage}) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
          radius: 30,
        ),
        title: Text(userName),
        subtitle: Text(userMassage),
        trailing: Text(userTime),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        drawer: Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Skype-icon.png/1200px-Skype-icon.png',
                      ),
                    ),
                  ),
                ),
                Text('Mirgo')
              ],
            ),
          ),
          actions: [
            Icon(
              Icons.search,
              size: 25,
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.comment),
              ),
              Tab(
                icon: Icon(
                  Icons.call,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_box,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            children: [
              listTile(
                userImage:
                    'https://scontent.flhe7-1.fna.fbcdn.net/v/t1.0-9/118594587_786682481877776_2033031788191754948_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=hojLQyTvCqgAX_nVI5M&_nc_ht=scontent.flhe7-1.fna&oh=7a2a67edff8b6576f6ce9cd2249d0f07&oe=5F7A696C',
                userMassage: 'Subscribe MY Channel',
                userName: 'Assar Baloch',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://scontent.flhe7-1.fna.fbcdn.net/v/t1.0-9/118614412_169864641372965_8269806170018974275_n.jpg?_nc_cat=108&_nc_sid=dd9801&_nc_ohc=1C7D9Cwxil0AX_qpMsG&_nc_ht=scontent.flhe7-1.fna&oh=0243a957525788882cdd58433f63443e&oe=5F79606B',
                userMassage: 'And Like then Comment',
                userName: 'Ansar Baloch',
                userTime: '3:00 PM',
              ),
                listTile(
                userImage:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRukjJb87rZlePZbfevSlqc6Hgq1_RT9iGSaw&usqp=CAU',
                userMassage: 'Subscribe MY Channel',
                userName: 'Carry Bahi',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://wikibio.in/wp-content/uploads/2019/01/Emiway-Bantai.jpg',
                userMassage: 'Subscribe MY Channel',
                userName: 'Emiway banti',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://img.etimg.com/thumb/width-1200,height-900,imgsize-408508,resizemode-1,msid-70474924/magazines/panache/bots-at-work-did-fake-views-make-badshahs-paagal-youtubes-most-viewed-video.jpg',
                userMassage: 'Subscribe MY Channel',
                userName: 'Badshah',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://upload.wikimedia.org/wikipedia/en/c/cb/Robert_Downey_Jr._as_Iron_Man_in_Avengers_Infinity_War.jpg',
                userMassage: 'Subscribe MY Channel',
                userName: 'Tony Stark',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://scontent.flhe7-1.fna.fbcdn.net/v/t1.0-9/118594587_786682481877776_2033031788191754948_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=hojLQyTvCqgAX_nVI5M&_nc_ht=scontent.flhe7-1.fna&oh=7a2a67edff8b6576f6ce9cd2249d0f07&oe=5F7A696C',
                userMassage: 'Subscribe MY Channel',
                userName: 'Assar Baloch',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://yt3.ggpht.com/a/AATXAJyWa_nQ2qFeJ67Zwe6QGgaZCs_QlZvn_IGEImn8Iw=s900-c-k-c0xffffffff-no-rj-mo',
                userMassage: 'Subscribe MY Channel',
                userName: 'Assar Baloch',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://scontent.flhe7-1.fna.fbcdn.net/v/t1.0-9/118594587_786682481877776_2033031788191754948_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=hojLQyTvCqgAX_nVI5M&_nc_ht=scontent.flhe7-1.fna&oh=7a2a67edff8b6576f6ce9cd2249d0f07&oe=5F7A696C',
                userMassage: 'Subscribe MY Channel',
                userName: 'Assar Baloch',
                userTime: '3:08 PM',
              ),
                listTile(
                userImage:
                    'https://scontent.flhe7-1.fna.fbcdn.net/v/t1.0-9/118594587_786682481877776_2033031788191754948_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=hojLQyTvCqgAX_nVI5M&_nc_ht=scontent.flhe7-1.fna&oh=7a2a67edff8b6576f6ce9cd2249d0f07&oe=5F7A696C',
                userMassage: 'Subscribe MY Channel',
                userName: 'Assar Baloch',
                userTime: '3:08 PM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
