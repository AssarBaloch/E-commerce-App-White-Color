import 'package:flutter/material.dart';

class MultipalLangugeApp extends StatelessWidget {
  @override
  Widget circle({String image, String name}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(image),
        ),
        Text(name),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Select Language',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        crossAxisSpacing: 80,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        children: [
          circle(
              image:
                  'https://vistapointe.net/images/flag-of-china-wallpaper-19.jpg',
              name: 'China'),
          circle(
              image:
                  'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1200px-Flag_of_the_United_States.svg.png',
              name: 'American'),
          circle(
              image:
                  'https://static.vecteezy.com/system/resources/previews/000/114/048/non_2x/free-vector-pakistan-flag.jpg',
              name: 'Pakistan'),
          circle(
              image:
                  'https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.png',
              name: 'England'),
          circle(
              image:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/255px-Flag_of_Australia_%28converted%29.svg.png',
              name: 'Australia'),
          circle(
              image:
                  'https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/255px-Flag_of_Italy.svg.png',
              name: 'China'),
        
        ],
      ),
    );
  }
}
