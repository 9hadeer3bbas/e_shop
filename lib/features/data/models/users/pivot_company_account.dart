class PivotCompanyAccount {
  int? modelId;
  int? roleId;
  String? modelType;

  PivotCompanyAccount({
    this.modelId,
    this.roleId,
    this.modelType,
  });

  PivotCompanyAccount.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    modelId = json['role_id'];
    modelId = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['model_id'] = modelId;
    data['role_id'] = roleId;
    data['model_type'] = modelType;

    return data;
  }
}
