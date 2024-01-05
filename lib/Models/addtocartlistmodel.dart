import 'dart:convert';
import 'package:rental/Models/productModel.dart';

Cartmodel cartmodelFromMap(String str) => Cartmodel.fromMap(json.decode(str));

String cartmodelToMap(Cartmodel data) => json.encode(data.toMap());

class Cartmodel {
  Product product;
  String selectedDays;
  int quantity;

  Cartmodel({
    required this.product,
    required this.selectedDays,
    required this.quantity,
  });

  factory Cartmodel.fromMap(Map<String, dynamic> json) => Cartmodel(
        product: Product.fromJson(json["product"]),
        selectedDays: json["selectedDays"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "product": product.toJson(),
        "selectedDays": selectedDays,
        "quantity": quantity,
      };
}
