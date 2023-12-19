import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/cloth.dart';
import 'package:rental/widgets/commonwidget.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController())
      ..getCategory()
      ..getProducts();
    return SafeArea(
      child: Obx(() {
        return homeController.categoryList.length == 0
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("RENTAL",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1b3e41),
                        )),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: Image.asset("assets/images/p1.png"),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SingleChildScrollView(
                    child: GetBuilder<HomeController>(
                      builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 380,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0x30CCCCCC),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child: Text(
                                    "Search",
                                    style: TextStyle(
                                      color: Color(0xFF787474),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.search,
                                    color: Color.fromARGB(120, 117, 117, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 122,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: controller.categoryList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      controller.getOnclickproduct(
                                          controller.categoryList[index].id);
                                      controller.selectedIndex.value = index;

                                      controller.selectedIndex.listen((value) {
                                        print("selectedIndex changed: $value");
                                      });
                                      controller.selectedcatid.value =
                                          controller.categoryList[index].id
                                              .toString();

                                      print(controller.selectedcatid.value);
                                    },
                                    child: Container(
                                      height: 114,
                                      width: 89,
                                      decoration: BoxDecoration(
                                          color: homeController.selectedIndex ==
                                                  index
                                              ? Color(0xFFDF453E)
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                        .categoryList[index]
                                                        .iconImage,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            homeController
                                                .categoryList[index].name,
                                            style: TextStyle(
                                              color: homeController
                                                          .selectedIndex
                                                          .value ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.black,
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
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Trending Products",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text("View all",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFDF453E),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          homeController.productlist.length > 0
                              ? Container(
                                  height: 500,
                                  child: GridView.builder(
                                    itemCount: 4,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      mainAxisExtent: 230,
                                      crossAxisCount: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return tpcontainer(
                                          homeController.productlist[index]);
                                    },
                                  ),
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.selectedIndex == 0
                                      ? 'Cloths'
                                      : controller.selectedIndex == 1
                                          ? 'Electronics'
                                          : controller.selectedIndex == 2
                                              ? 'Events'
                                              : controller.selectedIndex == 3
                                                  ? 'Appliences'
                                                  : controller.selectedIndex ==
                                                          4
                                                      ? 'Vehicles'
                                                      : 'Construction',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.getSubCategory(
                                        controller.selectedcatid.value);
                                  },
                                  child: Text("View all",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFDF453E),
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 600,
                            child: GridView.builder(
                              itemCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 230,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return tpcontainer(
                                    homeController.catawiseprdList[index]);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      }),
    );
  }
}
