class Product {
  int? id;
  int? categoryId;
  int? userId;
  String? name;
  int? oldPrice;
  int? newPrice;
  String? description;
  String? state;
  int? numOfSales;
  int? viewer;
  String? image;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.categoryId,
    this.userId,
    this.name,
    this.oldPrice,
    this.newPrice,
    this.description,
    this.state,
    this.numOfSales,
    this.viewer,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(Map<String, dynamic> json){
    id = json["id"];
    categoryId = json["category_id"];
    userId = json["user_id"];
    name = json["name"];
    oldPrice = json["old_price"];
    newPrice = json["new_price"];
    description = json["description"];
    state = json["state"];
    numOfSales = json["number_of_sales"];
    viewer = json["viewer"];
    image = json["imgURL"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data["id"] = id;
    data["category_id"] = categoryId;
    data["user_id"] = userId;
    data["name"] = name;
    data["old_price"] = oldPrice;
    data["new_price"] = newPrice;
    data["description"] = description;
    data["state"] = state;
    data["number_of_sales"] = numOfSales;
    data["viewer"] = viewer;
    data["imgURL"] = image;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;

    return data;
  }
}            

