import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rental/Models/categoryModel.dart';
import 'package:rental/Models/productModel.dart';
import 'package:rental/Models/subcategorymodel.dart';
import 'package:rental/main_screens/cloth.dart';
import 'package:rental/url.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getCategory();
    getProducts();
    super.onInit();
  }

  RxInt myindex = 0.obs;

  RxInt selectedIndex = 0.obs;
  RxString selectedcatid = '13'.obs;
  RxBool obxcheck = false.obs;
  RxList categoryList = [].obs;
  RxList productlist = [].obs;
  RxList subcategorylist = [].obs;

  getCategory() async {
    var response = await http.get(Uri.parse(categoryUrl));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var mydata = decodedData['data']['category'];

      List mylist = mydata.map((cata) => Category.fromMap(cata)).toList();

      categoryList.clear();
      categoryList.addAll(mylist);
      print(categoryList);
    } else {
      print(response.statusCode);
    }
  }

  //RxList<Product> catawiseprdList = RxList<Product>();
  RxList catawiseprdList = [].obs;

  getProducts() async {
    var response = await http.get(Uri.parse(productUrl));
    if (response.statusCode == 200) {
      print(response.body);
      var decode = jsonDecode(response.body);

      var mydata = decode['data']['product'];

      List newlist = mydata.map((prd) => Product.fromMap(prd)).toList();

      productlist.clear();
      productlist.addAll(newlist);
      print(newlist);
    } else {
      print("error to retrive products");
    }
    List teamplist = [];
    for (var cat in categoryList) {
      List dummylist = [];
      for (var prd in productlist) {
        if (cat.id.toString() == prd.category.toString()) {
          dummylist.add(prd);
        }
      }

      teamplist.add({'catId': cat.id.toString(), 'product': dummylist});

      List mylis = teamplist[0]['product'];
      catawiseprdList.clear();
      print(mylis);
      catawiseprdList.addAll(mylis);

      //  catawiseprdList.add(teamplist[0]['product']);
    }
  }

  getOnclickproduct(final cataId) {
    catawiseprdList.clear();
    for (var prd in productlist) {
      if (cataId.toString() == prd.category.toString()) {
        catawiseprdList.add(prd);
      }
    }

    update();
  }

  getSubCategory(catid) async {
    var mybody = {'category_id': catid};
    var response = await http.post(Uri.parse(subcategory), body: mybody);
    print(response.body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = decode['data']['subcategory'];
      List list = data.map((m) => Subcategorymodel.fromMap(m)).toList();

      subcategorylist.clear();
      subcategorylist.addAll(list);

      print(subcategorylist);

      //firts index subcategory data

      var subid = subcategorylist[0].id;
      getSubCategorywiseproduct(subid);
      print(subid);

      Get.to(() => cloth());
    } else {
      print("error in subcat");
      print(response.statusCode);
    }
  }

  RxList scatalist = [].obs;
  getSubCategorywiseproduct(final subId) {
    scatalist.clear();
    for (var i = 0; i < productlist.length; i++) {
      if (productlist[i].subcategory.toString() == subId.toString()) {
        scatalist.add(productlist[i]);
        print(scatalist);
      }
    }

    update();
  }

  RxInt tabIndex = 0.obs;

  changeTabIndex(index) {
    tabIndex.value = index;
  }

  changeNavbarTab(index) {
    myindex.value = index;
  }

  RxList searchList = [].obs;

  RxString searchValue = ''.obs;
  getsearchData(String searchString) {
    searchList.clear();
    var mylist = productlist
        .where((prd) => prd.name
                .toString()
                .toLowerCase()
                .startsWith(searchString.toLowerCase())
            //.contains(searchString.toLowerCase())

            )
        .toList();
    searchList.addAll(mylist);
    print(searchList);
  }
}
