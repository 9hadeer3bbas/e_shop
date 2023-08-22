class Category {
  int? id;
  String? name;
  String? image;
  String? createAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.createAt,
    this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    image = json['imgURL'] ?? "";
    createAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    if (data['id'] != null) {
      data['id'] = id;
    }

    if (data['name'] != null) {
      data['name'] = name;
    }

    data['imgURL'] = image;

    if (data['created_at'] != null) {
      data['created_at'] = createAt;
    }

    if (data['updated_at'] != null) {
      data['updated_at'] = updatedAt;
    }

    return data;
  }
}