import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/bookingcontroller.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/Models/productModel.dart';
import 'package:rental/main_screens/bottomsheet.dart';
import 'package:rental/url.dart';

class productscreen extends StatelessWidget {
  final Product prd;
  const productscreen({super.key, required this.prd});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController())..checkItemInCart(prd);
    final hcontroller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 269,
                  width: 350,
                  child: PageView.builder(
                    itemCount: prd.productImage.length,
                    itemBuilder: (context, index) {
                      var myimage = prd.productImage[index];
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(10),
                            //  border: Border.all(color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 239,
                              width: 325,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                imageuri + myimage.file,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 47, 0),
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ],
              ),
              SizedBox(
                height: 37,
              ),
              Container(
                width: 410,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: const Color.fromARGB(255, 231, 231, 231))
                    //color: Colors.blueGrey,
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prd.name.toString(),
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "₹ ",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.red),
                                ),
                                Text(
                                  prd.price.toString(),
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(prd.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            prd.clothdata.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product details:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Color       :",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${prd.clothdata[0].colour}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Sizes       :",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${prd.clothdata[0].size}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Color(0xFFF8F8F8),
          height: 64,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xBFDF453E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                      )),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFDF453E),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                    ),
                    child: Center(
                      child: Text(
                        "Call Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (controller.iscontain.value == false) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) => bottomsheet(context, prd));
                      } else {
                        hcontroller.changeNavbarTab(3);
                        print(hcontroller.myindex.value);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xBFDF453E),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                          )),
                      child: Center(
                        child: Text(
                          controller.iscontain.value == false
                              ? "Book Now"
                              : "Alredy available",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
