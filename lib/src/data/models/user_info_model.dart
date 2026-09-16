
class UpdateProfileModel {
  final String message;
  final UserInfoModel userInfo;

  const UpdateProfileModel({
    required this.message,
    required this.userInfo,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      message: json['message'] as String? ?? '',
      userInfo: UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userInfo': userInfo.toJson(),
    };
  }
}


class UserInfoModel {
  UserInfo? userInfo;

  UserInfoModel({this.userInfo});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userInfo = json['userInfo'] != null
        ? UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? id;
  String? fullName;
  String? gender;
  String? birthDate;
  Null lastSeen;
  String? image;
  String? bio;
  String? connection;

  UserInfo(
      {this.id,
        this.fullName,
        this.gender,
        this.birthDate,
        this.lastSeen,
        this.image,
        this.bio,
        this.connection});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    lastSeen = json['lastSeen'];
    image = json['image'];
    bio = json['bio'];
    connection = json['connection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['birthDate'] = birthDate;
    data['lastSeen'] = lastSeen;
    data['image'] = image;
    data['bio'] = bio;
    data['connection'] = connection;
    return data;
  }
}
