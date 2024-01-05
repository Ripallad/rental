import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/Models/productModel.dart';
import 'package:rental/main_screens/productscreen.dart';
import 'package:rental/url.dart';

class Homecontainer extends StatelessWidget {
  final Product product;
  const Homecontainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      height: 205,
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
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => productscreen(
                      prd: product,
                    ),
                  ),
                );
              },
              child: Container(
                width: 110,
                height: 102.02,
                decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(3)),
                child: Container(
                    width: 72,
                    height: 97.21,
                    child:
                        Image.network(imageuri + product.productImage[0].file)),
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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
              Text(
                product.price.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.85,
          ),
          Text(
            product.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

Homecontainer1(context, product) {
  final HomeController home1 = Get.put(HomeController());
  return Obx(() => home1.obxcheck == false
      ? InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => productscreen(
                prd: product,
              ),
            ));
          },
          child: Container(
            width: 142,
            height: 205,
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
                            imageuri + product.productImage[0].file)),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.85,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        )
      : Container());
}
