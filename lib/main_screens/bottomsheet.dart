import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/bookingcontroller.dart';
import 'package:rental/Controllers/homeController.dart';

Widget bottomsheet(context, product) {
  final booking = Get.put(BookingController());
  final home = Get.find<HomeController>();
  return Obx(
    () => Container(
      width: MediaQuery.of(context).size.width,
      height: 650,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Icon(Icons.close),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: Color(0xFFC4C4C4),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Select Days: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.90,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, top: 5, bottom: 5, left: 10),
                child: DropdownButton(
                    hint: booking.selectedDays.value == ''
                        ? Text("Select Days")
                        : Text('${booking.selectedDays.value} Days'),
                    isExpanded: true,
                    // value: booking.selectedDays.value,
                    items: booking.days
                        .map((day) => DropdownMenuItem(
                              value: day,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '$day Day'.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (val) {
                      booking.selectedDays.value = val.toString();
                      print(val);
                    }),
              ),
              Divider(
                color: Color(0xFFC4C4C4),
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Select Quantity: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.90,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 145,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0x30CCCCCC),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: InkWell(
                              onTap: () {
                                booking.decrementQty();
                              },
                              child: Icon(Icons.remove)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            width: 61,
                            height: 43,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Center(
                                child: Text(
                              booking.qty.value.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(
                              onTap: () {
                                booking.incrementQty();
                              },
                              child: Icon(Icons.add)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Divider(
                color: Color(0xFFC4C4C4),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.90,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    booking.selectedDays.value == ''
                        ? product.price.toString()
                        : booking.totalprice(product.price),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.90,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Divider(
                color: Color(0xFFC4C4C4),
              ),
              SizedBox(
                height: 23,
              ),
              InkWell(
                onTap: () {
                  if (booking.selectedDays.value == '') {
                    Get.snackbar('error', 'Please select days',
                        backgroundColor: Colors.red);
                  } else {
                    booking.addToCartList(product);
                    home.changeNavbarTab(3);
                  }
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  width: 390,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: Color(0xff1b3e41),
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
