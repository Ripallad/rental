import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/Controllers/homeController.dart';
import 'package:rental/widgets/commonwidget.dart';

class cloth extends StatefulWidget {
  const cloth({Key? key}) : super(key: key);

  @override
  State<cloth> createState() => _clothState();
}

class _clothState extends State<cloth> with TickerProviderStateMixin {
  final HomeController homeController = Get.put(HomeController());
  late TabController tabController;

  int previousIndex = 0;
  @override
  void initState() {
    tabController = TabController(
        length: homeController.subcategorylist.length, vsync: this);

    tabController.addListener(() {
      if (tabController.index != previousIndex) {
        homeController.getSubCategorywiseproduct(
          homeController.subcategorylist[tabController.index].id,
        );
        setState(() {
          previousIndex = tabController.index;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Color(0x30CCCCCC),
              child: TabBar(
                controller: tabController,
                labelPadding: EdgeInsets.only(left: 10),
                isScrollable: true,
                indicator: BoxDecoration(color: Colors.red),
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: homeController.subcategorylist
                    .map((sub) => InkWell(
                          onTap: () {
                            tabController.animateTo(
                                homeController.subcategorylist.indexOf(sub));
                            homeController.getSubCategorywiseproduct(sub.id);
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(child: Text(sub.name)),
                            ),
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
              controller: tabController,
              children: homeController.subcategorylist
                  .map(
                    (sub) => Container(
                      height: 1000,
                      child: GridView.builder(
                        itemCount: homeController.scatalist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 230,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return tpcontainer(homeController.scatalist[index]);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
