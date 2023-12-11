class Category {
  int id;
  String image;
  String iconImage;
  String name;
  String description;
  dynamic createdAt;
  dynamic updatedAt;

  Category({
    required this.id,
    required this.image,
    required this.iconImage,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        image: json["image"],
        iconImage: json["icon_image"],
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "icon_image": iconImage,
        "name": name,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
