import 'package:flutter/material.dart';
import 'package:food_app/widgets/rasied_button.dart';

class LoginPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/finalImage.jpg'),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/logoName.png'))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 6),
                        child: Text(
                          'username',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xffd6daf7),
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 6),
                        child: Text(
                          'password',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xffd6daf7),
                          filled: true,
                        
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 360,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 160,
                              height: 55,
                              child: RaisedButton(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                animationDuration: Duration(seconds: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(style: BorderStyle.none),
                                ),
                                disabledElevation: 50,
                                onPressed: () {},
                                color: Color(0xff337acc),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
