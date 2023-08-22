
import 'account_company_role.dart';

class UserCompanyAccount {
  int? id;
  String? firstName;
  String? email;
  String? type;
  String? createAt;
  String? updatedAt;
  List<AccountCompanyRole>? roles;

  UserCompanyAccount({
    this.id,
    this.firstName,
    this.email,
    this.type,
    this.createAt,
    this.updatedAt,
    this.roles,
  });

  UserCompanyAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    email = json['email'];
    type = json['type'];
    createAt = json['created_at'];
    updatedAt = json['updated_at'];

    List<AccountCompanyRole> roless = [];
    if (json['roles'] != null) {
      for (var item in json['roles']) {
        roless.add(AccountCompanyRole.fromJson(item));
      }
    }
    roles = roless;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['first_name'] = firstName;
    data['email'] = email;
    data['type'] = type;
    data['created_at'] = createAt;
    data['updated_at'] = updatedAt;

    List<Map<String, dynamic>> roless = [];

    if (roles != null && roles!.isNotEmpty) {
      for (AccountCompanyRole item in roles!) {
        roless.add(item.toJson());
      }
    }
    data['roles'] = roless;

    return data;
  }
}
