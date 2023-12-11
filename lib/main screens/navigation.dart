import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rental/main%20screens/allcategory.dart';
import 'package:rental/main%20screens/bagitem.dart';
import 'package:rental/main%20screens/editprofile.dart';
import 'package:rental/main%20screens/home.dart';
import 'package:rental/main%20screens/search.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

int myindex = 0;
List screen = [home(), search(), allcategory(), bagitem(), profile()];

class _navigationState extends State<navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[myindex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Color(0xFF1B3E41),
          buttonBackgroundColor: Color(0xFF1B3E41),
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          items: [
            Image.asset(
              "assets/images/home.png",
              height: 20,
              width: 20,
            ),
            Image.asset(
              "assets/images/search.png",
              height: 20,
              width: 20,
            ),
            Image.asset(
              "assets/images/category.png",
              height: 20,
              width: 20,
            ),
            Image.asset(
              "assets/images/bag.png",
              height: 20,
              width: 20,
            ),
            Icon(
              Icons.perm_identity,
              color: Colors.white,
            )
            // Image.asset(
            //   "assets/images/profile.png",
            //   height: 20,
            //   width: 20,
            // ),
          ]),
    );
  }
}
