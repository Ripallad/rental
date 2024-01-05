import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/main_screens/productscreen.dart';
import 'package:rental/url.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    var searchController = TextEditingController();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          // backgroundColor: Colors.amber,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("Search",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1b3e41),
                  )),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextFormField(
                  onChanged: (value) {
                    homeController.searchValue.value = value.toString();
                    homeController.getsearchData(searchController.text);
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
                      borderSide:
                          BorderSide(color: Color(0x30CCCCCC), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide:
                          BorderSide(color: Color(0x30CCCCCC), width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.searchList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => productscreen(
                              prd: homeController.searchList[index],
                            ),
                          ),
                        );
                      },
                      child: homeController.searchValue.value != ''
                          ? Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Container(
                                        width: 60,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(imageuri +
                                                homeController.searchList[index]
                                                    .productImage[0].file),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    Text(
                                      homeController.searchList[index].name,
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
                            )
                          : Column(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
