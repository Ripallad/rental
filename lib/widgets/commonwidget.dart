import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/productscreen.dart';

tpcontainer(prd) {
  return InkWell(
    onTap: () => Get.to(productscreen(prd: prd)),
    child: Container(
      // width: 142,
      //height: 220,
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
            padding: const EdgeInsets.only(top: 13, left: 20, right: 24),
            child: Container(
              width: 110,
              height: 102.02,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(3)),
              child: Container(
                width: 72,
                height: 97.21,
                child: Image.network(
                  "http://rentalhere.in/public/uploads/" +
                      prd.productImage[0].file,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹ ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
              SizedBox(
                width: 7.7,
              ),
              Text(
                prd.price.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.85,
          ),
          Text(
            prd.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homeCategory(context) {
  final HomeController homeController = Get.put(HomeController());

  return Obx(
    () => Container(
      height: 122,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: homeController.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                homeController
                    .getOnclickproduct(homeController.categoryList[index].id);
              },
              child: Container(
                height: 114,
                width: 89,
                decoration: BoxDecoration(
                    color: Color(0xFFDF453E),
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
                      padding:
                          const EdgeInsets.only(top: 13, left: 20, right: 24),
                      child: Container(
                        child: Image.network(
                          "http://rentalhere.in/public/uploads/" +
                              homeController.categoryList[index].iconImage,
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
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
