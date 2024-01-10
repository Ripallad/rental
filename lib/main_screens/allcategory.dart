import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/cloth.dart';
import 'package:rental/main_screens/navigation.dart';

class allcategory extends StatelessWidget {
  const allcategory({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text("Allcategory",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1b3e41),
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: Column(
            children: [
              Container(
                height: 350,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 140,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        homeController.selectedcatid.value =
                            homeController.categoryList[index].id.toString();
                        homeController
                            .getSubCategory(controller.selectedcatid.value);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x14000000),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 20, right: 24),
                              child: Container(
                                child: Image.network(
                                  "http://rentalhere.in/public/uploads/" +
                                      homeController
                                          .categoryList[index].iconImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              homeController.categoryList[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
