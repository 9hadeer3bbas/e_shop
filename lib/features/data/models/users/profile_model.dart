class ProfileModel {
  bool? status;
  String? message;
  List<Profile>? profile;

  ProfileModel({this.status, this.message, this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    List<Profile> data = <Profile>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Profile.fromJson(v));
      });
    }
    profile = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (profile != null) {
      data['data'] = profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? emailVerifiedAt;
  String? password;
  String? type;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? owner;
  int? isConfirmed;
  String? imgURL;

  Profile(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.type,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.owner,
      this.isConfirmed,
      this.imgURL});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    type = json['type'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    owner = json['owner'];
    isConfirmed = json['is_confirmed'];
    imgURL = json['imgURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['type'] = type;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['owner'] = owner;
    data['is_confirmed'] = isConfirmed;
    data['imgURL'] = imgURL;
    return data;
  }
}
