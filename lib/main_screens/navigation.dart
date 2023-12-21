import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/allcategory.dart';
import 'package:rental/main_screens/bagitem.dart';
import 'package:rental/main_screens/editprofile.dart';
import 'package:rental/main_screens/home.dart';
import 'package:rental/main_screens/search.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

List screen = [home(), search(), allcategory(), bagitem(), profile()];

class _navigationState extends State<navigation> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () => Scaffold(
        body: screen[controller.myindex.value],
        bottomNavigationBar: CurvedNavigationBar(
            index: controller.myindex.value,
            height: 60,
            color: Color(0xFF1B3E41),
            buttonBackgroundColor: Color(0xFF1B3E41),
            backgroundColor: Colors.white,
            onTap: (index) {
              controller.myindex.value = index;
              print(controller.myindex.value);
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
            ]),
      ),
    );
  }
}