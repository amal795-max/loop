class RegisterModel {
  User? user;

  RegisterModel({this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? phone;
  int? id;
  String? userName;
  Null verifiedAt;
  String? token;

  User({this.phone, this.id, this.userName, this.verifiedAt, this.token});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    id = json['id'];
    userName = json['userName'];
    verifiedAt = json['verifiedAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['id'] = id;
    data['userName'] = userName;
    data['verifiedAt'] = verifiedAt;
    data['token'] = token;
    return data;
  }
}
