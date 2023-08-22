import 'pivot_company_account.dart';

class AccountCompanyRole {
  String? id;
  String? name;
  String? guardName;
  String? createAt;
  String? updatedAt;
  PivotCompanyAccount? pivotCompanyAccount;

  AccountCompanyRole({
    this.id,
    this.name,
    this.guardName,
    this.createAt,
    this.updatedAt,
    this.pivotCompanyAccount,
  });

  AccountCompanyRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivotCompanyAccount = PivotCompanyAccount.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['guard_name'] = guardName;
    data['created_at'] = createAt;
    data['updated_at'] = updatedAt;
    data['pivot'] = pivotCompanyAccount!.toJson();

    return data;
  }
}
