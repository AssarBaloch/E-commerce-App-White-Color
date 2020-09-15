import 'package:flutter/material.dart';

class FacebookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 95,
        leading: Icon(
          Icons.camera_alt,
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          height: 50,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
                fillColor: Colors.grey[300],
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.network(
              'https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Messenger_colored_svg-512.png',
              height: 20,
              width: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(
              'Stories',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              'See Archive  >',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://www.pngmart.com/files/4/Actor-PNG-Picture.png',
                        ),
                      ),
                      color: Color(0xffc8f5f2),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90, top: 10),
                          child: CircleAvatar(
                            child: Icon(Icons.add),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'AssarBaloch',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://www.pngmart.com/files/4/Actor-PNG-Photos.png"),
                      ),
                      color: Color(0xffa56387),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90, top: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(
                              "http://www.pngmart.com/files/4/Actor-PNG-Photos.png",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'SabirBaloch',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://www.pngmart.com/files/4/Actor-Transparent-Background.png"),
                      ),
                      color: Color(0xfffcbbe5),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90, top: 10),
                          child: CircleAvatar(
                            backgroundColor: Color(0xff59c9d1),
                            backgroundImage: NetworkImage(
                              "http://www.pngmart.com/files/4/Actor-Transparent-Background.png",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Aqeel Bugti',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://www.pngmart.com/files/4/Actor-PNG-Photo.png',
                        ),
                      ),
                      color: Color(0xffd4c908),
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 90, top: 10),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'http://www.pngmart.com/files/4/Actor-PNG-Photo.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Shakeel Jan',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 27,
              backgroundColor: Color(0xffc8f5f2),
              backgroundImage: NetworkImage(
                'http://www.pngmart.com/files/4/Actor-Transparent-Background.png',
              ),
            ),
            title: Text('Assar Baloch  Update Cover Photo'),
            subtitle: Text('3 mint ago'),
            trailing: Icon(Icons.more_horiz),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffc8f5f2),
              image: DecorationImage(
                image: NetworkImage(
                  'http://www.pngmart.com/files/4/Actor-Transparent-Background.png',
                ),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/proxy/dxEAsbez-f1vKK7EWwTgSKN7FEceU_ifHBD6jSr3ydVJLoCkq3fKIbfgxhiESN1yb7xadxsQFLIWuFeKjcekv0nnYwhYmB3Jz_TyvktU1RYdCDaPfDd2o92IidaNNEg',
                        height: 27,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Image.network(
                        'https://cdn3.iconfinder.com/data/icons/complete-set-icons/512/favourite512x512.png',
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '400',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Text(
                  '122 Comments',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.network(
                      'https://images.vexels.com/media/users/3/157338/isolated/preview/4952c5bde17896bea3e8c16524cd5485-facebook-like-icon-by-vexels.png',
                      height: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Like'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://i.dlpng.com/static/png/6859702_preview.png',
                        height: 23,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('comments'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 35,
                ),
                SizedBox(
                  width: 55,
                ),
                Icon(
                  Icons.supervisor_account,
                  size: 35,
                ),
                SizedBox(
                  width: 55,
                ),
                Icon(
                  Icons.home,
                  size: 35,
                ),
                SizedBox(
                  width: 55,
                ),
                Icon(
                  Icons.local_activity,
                  size: 35,
                ),
                SizedBox(
                  width: 55,
                ),
                CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(
                    'http://www.pngmart.com/files/4/Actor-Transparent-Background.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
