import 'dart:io';
import 'package:dio/dio.dart';

class RegisterParams {
  final String phone;
  final String userName;
  final String fullName;
  final String gender;
  final String birthDate;

  RegisterParams({
    required this.phone,
    required this.userName,
    required this.fullName,
    required this.gender,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'userName': userName,
        'fullName': fullName,
        'gender': gender,
        'birthDate': birthDate,
      };
}

class LoginParams {
  final String phone;

  LoginParams({required this.phone});

  Map<String, dynamic> toJson() => {
        'phone': phone,
      };
}

class UpdateProfileParams {
  final String fullName;
  final String gender;
  final String birthDate;
  final String bio;
  final String connection;
  final File? image;

  UpdateProfileParams({
    required this.fullName,
    required this.gender,
    required this.birthDate,
    required this.bio,
    required this.connection,
    this.image,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> map = {
      'fullName': fullName,
      'gender': gender,
      'birthDate': birthDate,
      'bio': bio,
      'connection': connection,
    };

    if (image != null) {
      map['image'] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return FormData.fromMap(map);
  }
}

class UpdateProfileRequestModel {
  final String fullName;
  final String gender;
  final String birthDate;
  final String bio;
  final String connection;
  final File? image;

  const UpdateProfileRequestModel({
    required this.fullName,
    required this.gender,
    required this.birthDate,
    required this.bio,
    required this.connection,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'gender': gender,
      'birthDate': birthDate,
      'bio': bio,
      'connection': connection,
    };
  }
}