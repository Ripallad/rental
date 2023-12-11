// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  bool success;
  Data data;
  String message;

  ProductModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        data: Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
        "message": message,
      };
}

class Data {
  List<Product> product;
  String message;

  Data({
    required this.product,
    required this.message,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "product": List<dynamic>.from(product.map((x) => x.toMap())),
        "message": message,
      };
}

class Product {
  int id;
  String name;
  int category;
  int subcategory;
  String? item;
  int price;
  int quantity;
  int? status;
  CurrentStatus? currentStatus;
  int? totalQty;
  String description;
  int vendorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ProductImage> productImage;
  List<Clothdatum> clothdata;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.subcategory,
    required this.item,
    required this.price,
    required this.quantity,
    required this.status,
    required this.currentStatus,
    required this.totalQty,
    required this.description,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.productImage,
    required this.clothdata,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        subcategory: json["subcategory"],
        item: json["Item"],
        price: json["price"],
        quantity: json["quantity"],
        status: json["status"],
        currentStatus: currentStatusValues.map[json["current_status"]],
        totalQty: json["total_qty"],
        description: json["description"],
        vendorId: json["vendor_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromMap(x))),
        clothdata: List<Clothdatum>.from(
            json["clothdata"].map((x) => Clothdatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "category": category,
        "subcategory": subcategory,
        "Item": item,
        "price": price,
        "quantity": quantity,
        "status": status,
        "current_status": currentStatusValues.reverse[currentStatus],
        "total_qty": totalQty,
        "description": description,
        "vendor_id": vendorId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_image": List<dynamic>.from(productImage.map((x) => x.toMap())),
        "clothdata": List<dynamic>.from(clothdata.map((x) => x.toMap())),
      };
}

class Clothdatum {
  int id;
  int size;
  String colour;
  int productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Clothdatum({
    required this.id,
    required this.size,
    required this.colour,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clothdatum.fromMap(Map<String, dynamic> json) => Clothdatum(
        id: json["id"],
        size: json["size"],
        colour: json["colour"],
        productId: json["product_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "size": size,
        "colour": colour,
        "product_id": productId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum CurrentStatus { AVAILABLE, ON_RENT }

final currentStatusValues = EnumValues(
    {"Available": CurrentStatus.AVAILABLE, "On Rent": CurrentStatus.ON_RENT});

class ProductImage {
  int id;
  String file;
  int productId;
  dynamic createdAt;
  dynamic updatedAt;

  ProductImage({
    required this.id,
    required this.file,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        file: json["file"],
        productId: json["product_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "file": file,
        "product_id": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
