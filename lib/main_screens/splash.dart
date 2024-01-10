import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/main_screens/login.dart';
import 'package:rental/main_screens/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      SharedPreferences sp = await SharedPreferences.getInstance();
      if (sp.containsKey('phoneLogin') || sp.containsKey('googleLogin')) {
        Get.offAll(navigation());
      } else {
        Get.offAll(login());
      }
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
