import 'package:flutter/material.dart';

import 'package:rental/main_screens/home.dart';
import 'package:rental/widgets/button.dart';

class emptybag extends StatelessWidget {
  const emptybag({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/emptybag.png"),
          SizedBox(
            height: 36,
          ),
          Text(
            "Your bag is lonely",
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Add some items to cheer it up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.30,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          button("Go To Home", home(), context)
        ],
      ),
    );
  }
}
