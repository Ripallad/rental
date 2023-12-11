import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/widgets/commonwidget.dart';

class cloth extends StatelessWidget {
  const cloth({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController())
      ..getCategory()
      ..getProducts();
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("Cloth",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1b3e41),
                  )),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    color: Color(0x30CCCCCC),
                    child: TabBar(
                      indicator: BoxDecoration(color: Colors.red),
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Container(child: Text("Men")),
                        Text("Women"),
                        Text("Kids"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                homeController.productlist.length > 0
                    ? Container(
                        height: 1000,
                        child: GridView.builder(
                          itemCount: 6,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
