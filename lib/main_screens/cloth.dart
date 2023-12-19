import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/widgets/commonwidget.dart';

class cloth extends StatelessWidget {
  const cloth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Cloth",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: Color(0xff1b3e41),
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: homeController.subcategorylist.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Color(0x30CCCCCC),
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 10),
                  isScrollable: true,
                  indicator: BoxDecoration(color: Colors.red),
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: homeController.subcategorylist
                      .map((sub) => Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Text(sub.name)),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: homeController.subcategorylist
                    .map(
                      (sub) => Container(
                        height: 1000,
                        child: GridView.builder(
                          itemCount: homeController.catawiseprdList.length,
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
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
