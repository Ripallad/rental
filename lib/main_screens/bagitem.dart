import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/bookingcontroller.dart';
import 'package:rental/main_screens/emptybag.dart';
import 'package:rental/main_screens/finalorder.dart';
import 'package:rental/url.dart';
import 'package:rental/widgets/button.dart';

class BagItem extends StatelessWidget {
  const BagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booking = Get.put(BookingController());

    print("cart list ${booking.cartList}");

    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: Color(0xFFF8F8F8),
          appBar: AppBar(
            title: Text(
              "Bag items",
              style: TextStyle(
                color: Color(0xFF1B3E41),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    if (booking.selectedCartItemList.isEmpty) {
                      Get.snackbar("No Selected", "Please Select item");
                    } else {
                      booking.isDeleteclick.value = true;
                    }
                  },
                  child: Icon(
                    Icons.delete,
                  ),
                ),
              ),
            ],
          ),
          body: booking.cartList.length == 0
              ? emptybag()
              : ListView.builder(
                  itemCount: booking.cartList.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      key: Key('${booking.cartList[index]}'),
                      child: notEmptyBag(context, booking.cartList[index]),
                      endActionPane:
                          ActionPane(motion: DrawerMotion(), children: [
                        SlidableAction(
                          onPressed: (v) {
                            booking.deleteprd(v);
                          },
                          backgroundColor: Colors.green,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ]),
                    );
                  },
                ),
          bottomSheet: booking.selectedCartItemList.isNotEmpty &&
                  booking.isDeleteclick.value == true
              ? Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  height: 250,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remove ${booking.selectedCartItemList.length} item",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    booking.isDeleteclick.value = false;
                                    //Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          "Are you sure you want to remove ${booking.selectedCartItemList.length}  item from bag.",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        InkWell(
                          onTap: () {
                            booking.deleteSelectedList();
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            width: 380,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF1B3E41),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : booking.selectedCartItemList.isNotEmpty &&
                      booking.isDeleteclick.value == false
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        color: Colors.white,
                      ),
                      height: 150,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total (${booking.selectedCartItemList.length} item) :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "₹ ${booking.selectedPrice.value} ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFDF453E)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 31,
                            ),
                            button("Place order", finalorder(), context)
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 0,
                    ),
        ),
      ),
    );
  }
}

Widget notEmptyBag(context, item) {
  final booking = Get.find<BookingController>();
  print(item);
  return Obx(
    () => booking.obxcheck.value == true
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 370,
              height: 141,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 94.43,
                              height: 91,
                              child: Image.network(
                                imageuri + item.product.productImage[0].file,
                                fit: BoxFit.cover,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                booking.manageSelectedList(item);
                              },
                              child: booking.selectedCartItemList.contains(item)
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.done,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFDF453E),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  : Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFB2A9A9)),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.product.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "₹ ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFDF453E)),
                                  ),
                                  Text(
                                    booking.productPrice(item.selectedDays,
                                        item.product.price, item.quantity),
                                    //"1340",
                                    style: TextStyle(
                                      color: Color(0xFFDF453E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Days: ${item.selectedDays}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 95,
                                    height: 29.48,
                                    decoration: BoxDecoration(
                                      color: Color(0x30CCCCCC),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.remove),
                                        Container(
                                          width: 39.97,
                                          height: 28.17,
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                          child: Center(
                                              child: Text(
                                            "1",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                        ),
                                        Icon(Icons.add)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
  );
}
