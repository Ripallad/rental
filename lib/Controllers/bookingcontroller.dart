import 'package:get/get.dart';

import 'package:rental/Models/addtocartlistmodel.dart';
import 'package:rental/Models/productModel.dart';


class BookingController extends GetxController {
  RxBool obxcheck = false.obs;
  RxInt qty = 1.obs;
  RxString selectedDays = ''.obs;
  final List<String> days = ['1', '2', '3'];

  incrementQty() {
    if (qty.value < 10) {
      qty.value = qty.value + 1;
      print(qty);
    }
  }

  decrementQty() {
    if (qty.value > 1) {
      qty.value = qty.value - 1;
      print(qty);
    }
  }

  totalprice(origionalprice) {
    var total = origionalprice * qty.value * int.parse(selectedDays.value);
    return total.toString();
  }

  //bag item perticular prd total price
  productPrice(String days, int price, int qt) {
    var total = price * qt * int.parse(days);
    return total.toString();
  }

  RxList cartList = [].obs;

  addToCartList(product) {
    print(selectedDays.value);
    print(qty.value);
    var myprd = Cartmodel(
        product: product,
        selectedDays: selectedDays.value,
        quantity: qty.value);

    cartList.add(myprd);

    print(cartList);
    selectedDays.value = '';
    qty.value = 1;
  }

  //manage booking bootomsheet
  RxBool isItemselected = false.obs;

  RxList selectedCartItemList = [].obs;

  RxInt selectedPrice = 0.obs;

  manageSelectedList(Cartmodel item) {
    var price =
        productPrice(item.selectedDays, item.product.price, item.quantity);
    if (selectedCartItemList.contains(item)) {
      selectedCartItemList.remove(item);
      selectedPrice.value -= int.parse(price);
    } else {
      selectedCartItemList.add(item);
      selectedPrice.value += int.parse(price);
    }
  }

  RxBool iscontain = false.obs;
  RxBool isDeleteclick = false.obs;

  checkItemInCart(Product product) {
    if (cartList.isNotEmpty) {
      print("out of loop");
      for (var i = 0; i < cartList.length; i++) {
        print("in for loop");
        if (cartList[i].product == product) {
          iscontain.value = true;
          print("contain");
        } else {
          iscontain.value = false;
          print("not containe");
        }
      }
    } else {
      print("empty list");
    }
  }

  deleteprd(myindex) {
    if (cartList.contains(myindex)) {
      cartList.remove(myindex);
    }
  }

  deleteSelectedList() {
    for (var i = 0; i < selectedCartItemList.length; i++) {
      cartList.remove(selectedCartItemList[i]);
    }
    selectedCartItemList.value = [];
  }
}
