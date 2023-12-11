import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:rental/main%20screens/home.dart';
import 'package:rental/main%20screens/navigation.dart';

class bagitem extends StatelessWidget {
  const bagitem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text("Emptybag",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1b3e41),
                )),
          ),
        ),
        body: Center(
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
              InkWell(
                onTap: () => Get.to(navigation()),
                child: Container(
                  width: 390,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38),
                      color: Color(0xff1b3e41)),
                  child: Center(
                    child: Text(
                      "go to home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
