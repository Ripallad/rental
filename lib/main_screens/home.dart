// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rental/Controllers/homeController.dart';
// import 'package:rental/main_screens/productscreen.dart';
// import 'package:rental/url.dart';
// import 'package:rental/widgets/commonwidget.dart';

// class home extends StatelessWidget {
//   const home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final HomeController homeController = Get.put(HomeController());
//     var searchController = TextEditingController();

//     return SafeArea(
//       child: Obx(
//         () {
//           return homeController.categoryList.length == 0
//               ? Scaffold(
//                   body: Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 )
//               : Scaffold(
//                   appBar: AppBar(
//                     automaticallyImplyLeading: false,
//                     toolbarHeight: 70,
//                     title: Padding(
//                       padding: const EdgeInsets.only(left: 25),
//                       child: Text("RENTAL",
//                           style: TextStyle(
//                             fontSize: 19,
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xff1b3e41),
//                           )),
//                     ),
//                     actions: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30),
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey,
//                           ),
//                           child: Image.asset("assets/images/p1.png"),
//                         ),
//                       )
//                     ],
//                   ),
//                   body: Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: SingleChildScrollView(
//                       child: GetBuilder<HomeController>(
//                         builder: (controller) => Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             TextFormField(
//                               onChanged: (value) {
//                                 homeController.searchValue.value =
//                                     value.toString();
//                                 homeController
//                                     .getsearchData(searchController.text);
//                               },
//                               controller: searchController,
//                               showCursor: true,
//                               keyboardType: TextInputType.text,
//                               decoration: InputDecoration(
//                                 suffixIcon: Icon(Icons.search),
//                                 prefixIconColor: Color(0xFF787474),
//                                 contentPadding: EdgeInsets.only(
//                                     top: 13, bottom: 13, left: 20),
//                                 filled: true,
//                                 fillColor: Color(0x30CCCCCC),
//                                 hintText: "Search",
//                                 hintStyle: TextStyle(color: Color(0xFF787474)),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(13),
//                                   borderSide: BorderSide(
//                                       color: Color(0x30CCCCCC), width: 2),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(13),
//                                   borderSide: BorderSide(
//                                       color: Color(0x30CCCCCC), width: 2),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             homeController.searchValue.value != ''
//                                 ? Column(
//                                     children: [
//                                       ListView.builder(
//                                         physics: NeverScrollableScrollPhysics(),
//                                         shrinkWrap: true,
//                                         itemCount:
//                                             homeController.searchList.length,
//                                         itemBuilder: (context, index) {
//                                           return InkWell(
//                                             onTap: () {
//                                               Navigator.of(context).push(
//                                                 MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       productscreen(
//                                                     prd: homeController
//                                                         .searchList[index],
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               bottom: 10),
//                                                       child: Container(
//                                                         width: 60,
//                                                         height: 50,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           image:
//                                                               DecorationImage(
//                                                             image: NetworkImage(imageuri +
//                                                                 homeController
//                                                                     .searchList[
//                                                                         index]
//                                                                     .productImage[
//                                                                         0]
//                                                                     .file),
//                                                             fit: BoxFit.contain,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 13,
//                                                     ),
//                                                     Text(
//                                                       homeController
//                                                           .searchList[index]
//                                                           .name,
//                                                       style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 13,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Divider(
//                                                   thickness: 2,
//                                                 )
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ],
//                                   )
//                                 : Column(
//                                     children: [
//                                       Container(
//                                         height: 122,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         child: ListView.builder(
//                                           itemCount:
//                                               controller.categoryList.length,
//                                           scrollDirection: Axis.horizontal,
//                                           itemBuilder: (context, index) {
//                                             return Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   controller.getOnclickproduct(
//                                                       controller
//                                                           .categoryList[index]
//                                                           .id);
//                                                   controller.selectedIndex
//                                                       .value = index;

//                                                   controller.selectedIndex
//                                                       .listen((value) {
//                                                     print(
//                                                         "selectedIndex changed: $value");
//                                                   });
//                                                   controller
//                                                           .selectedcatid.value =
//                                                       controller
//                                                           .categoryList[index]
//                                                           .id
//                                                           .toString();

//                                                   print(controller
//                                                       .selectedcatid.value);
//                                                 },
//                                                 child: Container(
//                                                   height: 114,
//                                                   width: 89,
//                                                   decoration: BoxDecoration(
//                                                       color: homeController
//                                                                   .selectedIndex ==
//                                                               index
//                                                           ? Color(0xFFDF453E)
//                                                           : Colors.white,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color:
//                                                               Color(0x14000000),
//                                                           blurRadius: 4,
//                                                           offset: Offset(0, 2),
//                                                           spreadRadius: 0,
//                                                         )
//                                                       ]),
//                                                   child: Column(
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                                 top: 13,
//                                                                 left: 20,
//                                                                 right: 24),
//                                                         child: Container(
//                                                           child: Image.network(
//                                                             "http://rentalhere.in/public/uploads/" +
//                                                                 homeController
//                                                                     .categoryList[
//                                                                         index]
//                                                                     .iconImage,
//                                                             fit: BoxFit.fill,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 10,
//                                                       ),
//                                                       Text(
//                                                         homeController
//                                                             .categoryList[index]
//                                                             .name,
//                                                         style: TextStyle(
//                                                           color: homeController
//                                                                       .selectedIndex
//                                                                       .value ==
//                                                                   index
//                                                               ? Colors.white
//                                                               : Colors.black,
//                                                           fontSize: 13,
//                                                           fontWeight:
//                                                               FontWeight.w600,
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Trending Products",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   Text("View all",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                         color: Color(0xFFDF453E),
//                                       ))
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             homeController.productlist.length > 0
//                                 ? Container(
//                                     height: 500,
//                                     child: GridView.builder(
//                                       itemCount: 4,
//                                       physics: NeverScrollableScrollPhysics(),
//                                       gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisSpacing: 20,
//                                         mainAxisSpacing: 20,
//                                         mainAxisExtent: 230,
//                                         crossAxisCount: 2,
//                                       ),
//                                       itemBuilder: (context, index) {
//                                         return tpcontainer(
//                                             homeController.productlist[index]);
//                                       },
//                                     ),
//                                   )
//                                 : Container(),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     controller.selectedIndex == 0
//                                         ? 'Cloths'
//                                         : controller.selectedIndex == 1
//                                             ? 'Electronics'
//                                             : controller.selectedIndex == 2
//                                                 ? 'Events'
//                                                 : controller.selectedIndex == 3
//                                                     ? 'Appliences'
//                                                     : controller.selectedIndex ==
//                                                             4
//                                                         ? 'Vehicles'
//                                                         : 'Construction',
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       homeController.getSubCategory(
//                                           controller.selectedcatid.value);
//                                     },
//                                     child: Text("View all",
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w600,
//                                           color: Color(0xFFDF453E),
//                                         )),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 600,
//                               child: GridView.builder(
//                                 itemCount: 4,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisSpacing: 20,
//                                   mainAxisSpacing: 20,
//                                   mainAxisExtent: 230,
//                                   crossAxisCount: 2,
//                                 ),
//                                 itemBuilder: (context, index) {
//                                   return tpcontainer(
//                                       homeController.catawiseprdList[index]);
//                                 },
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ));
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/navigation.dart';
import 'package:rental/main_screens/productscreen.dart';
import 'package:rental/meetcomponant/homecontainer.dart';
import 'package:rental/url.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController home1 = Get.put(HomeController());
    //  final auth = Get.find<authController>();
    var searchController = TextEditingController();
    return SafeArea(
      child: Obx(() {
        return home1.productlist.length > 3
            ? Scaffold(
                backgroundColor: Color(0xFFF8F8F8),
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "RENTAL",
                      style: TextStyle(
                        color: Color(0xFF1B3E41),
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 31),
                      child: InkWell(
                        onTap: () {
                          //   auth.appLogout();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/prof1.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 31, left: 15, right: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            home1.searchValue.value = value.toString();
                            home1.getsearchData(searchController.text);
                          },
                          controller: searchController,
                          showCursor: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            prefixIconColor: Color(0xFF787474),
                            contentPadding:
                                EdgeInsets.only(top: 13, bottom: 13, left: 20),
                            filled: true,
                            fillColor: Color(0x30CCCCCC),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Color(0xFF787474)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide(
                                  color: Color(0x30CCCCCC), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                              borderSide: BorderSide(
                                  color: Color(0x30CCCCCC), width: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        home1.searchValue.value != ''
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: home1.searchList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => productscreen(
                                            prd: home1.searchList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Container(
                                                width: 60,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        imageuri +
                                                            home1
                                                                .searchList[
                                                                    index]
                                                                .productImage[0]
                                                                .file),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Text(
                                              home1.searchList[index].name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 122,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      itemCount: home1.categoryList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              home1.selectedcatid.value = home1
                                                  .categoryList[index].id
                                                  .toString();

                                                   controller.getOnclickproduct(
                                                      controller
                                                          .categoryList[index]
                                                          .id);

                                              // home1.getSubCategorywiseproduct(
                                              //     home1.categoryList[index].id);
                                              home1.selectedIndex.value = index;
                                            },
                                            child: Container(
                                              height: 114,
                                              width: 89,
                                              decoration: BoxDecoration(
                                                  color: home1.selectedIndex ==
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 13,
                                                            left: 20,
                                                            right: 24),
                                                    child: Container(
                                                      child: Image.network(
                                                        imageuri +
                                                            home1
                                                                .categoryList[
                                                                    index]
                                                                .iconImage,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    home1.categoryList[index]
                                                        .name,
                                                    style: TextStyle(
                                                      color:
                                                          home1.selectedIndex ==
                                                                  index
                                                              ? Colors.white
                                                              : Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
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

                                  // horizontalListView(context,home1.catagoryList),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Trending Products",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "View All",
                                        style: TextStyle(
                                          color: Color(0xFFDF453E),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  home1.productlist.length > 0
                                      ? Container(
                                          height: 445,
                                          child: GridView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisExtent: 205,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20,
                                                    crossAxisCount: 2),
                                            itemBuilder: (context, index) {
                                              return Homecontainer(
                                                product:
                                                    home1.productlist[index],
                                              );
                                            },
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 26,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        home1.selectedcatid == '13'
                                            ? "Cloths"
                                            : home1.selectedcatid == '14'
                                                ? "Electronics"
                                                : home1.selectedcatid == '15'
                                                    ? "Events"
                                                    : home1.selectedcatid ==
                                                            '16'
                                                        ? "Appliances"
                                                        : home1.selectedcatid ==
                                                                '17'
                                                            ? "Vehicles"
                                                            : home1.selectedcatid ==
                                                                    '18'
                                                                ? "Constructions"
                                                                : 'Cloths',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          home1.getSubCategory(
                                              controller.selectedcatid.value);
                                        },
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                            color: Color(0xFFDF453E),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 445,
                                    child: GridView.builder(
                                      itemCount: 4,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 205,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20,
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        print(
                                            ' index of catalist: ${home1.catawiseprdList[index]}');
                                        return Homecontainer1(context,
                                            home1.catawiseprdList[index]
                                            //  home1.catawisePrd[index]
                                            );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      }),
    );
  }
}
