import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rental/Models/categoryModel.dart';
import 'package:rental/Models/productModel.dart';
import 'package:rental/url.dart';

class HomeController extends GetxController {
  RxBool obxcheck = false.obs;
  RxList categoryList = [].obs;
  RxList productlist = [].obs;

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
  }
}
