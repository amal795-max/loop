class UserInfoModel {
  final int? id;
  final String? fullName;
  final String? gender;
  final String? birthDate;
  final String? image;
  final String? bio;
  final String? connection;
  final String? lastSeen;
  final int? userId;

  const UserInfoModel({
    this.id,
    this.fullName,
    this.gender,
    this.birthDate,
    this.image,
    this.bio,
    this.connection,
    this.lastSeen,
    this.userId,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as int?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] as String?,
      image: json['image'] as String?,
      bio: json['bio'] as String?,
      connection: json['connection'] as String?,
      lastSeen: json['lastSeen']?.toString(),
      userId: json['userId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'gender': gender,
      'birthDate': birthDate,
      'image': image,
      'bio': bio,
      'connection': connection,
      'lastSeen': lastSeen,
      'userId': userId,
    };
  }
}

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
