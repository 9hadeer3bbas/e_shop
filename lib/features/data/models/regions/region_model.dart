class RegionModel {
  int? id;
  int? governorateId;
  String? name;
  String? createdAt;
  String? updatedAt;

  RegionModel({
    this.id,
    this.governorateId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  RegionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateId = json['governorate_id'];
    name = json['name'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['governorate_id'] = governorateId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}
