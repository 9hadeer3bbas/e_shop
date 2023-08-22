class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? emailVerified;
  String? type;
  String? createAt;
  String? updatedAt;

  Users({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerified,
    this.type,
    this.createAt,
    this.updatedAt,
  });

  Users.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerified = json['email_verified_at'];
    type = json['type'];
    createAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerified;
    data['type'] = type;
    data['created_at'] = createAt;
    data['updated_at'] = updatedAt;

    return data;
  }
}
