import 'dart:io';
import '../../../data/models/user_info_model.dart';

class ProfileState {
  final bool isLoading;
  final String fullName;
  final String gender;
  final String birthDate;
  final String bio;
  final String connection;
  final File? selectedImage;
  final UserInfoModel? userInfo;
  final String? errorMessage;
  final bool isSuccess;

  const ProfileState({
    this.isLoading = false,
    this.fullName = 'Ahmed Ali',
    this.gender = 'Male',
    this.birthDate = '1995-05-10',
    this.bio = 'Hello world',
    this.connection = 'Online',
    this.selectedImage,
    this.userInfo,
    this.errorMessage,
    this.isSuccess = false,
  });

  ProfileState copyWith({
    bool? isLoading,
    String? fullName,
    String? gender,
    String? birthDate,
    String? bio,
    String? connection,
    File? selectedImage,
    UserInfoModel? userInfo,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      bio: bio ?? this.bio,
      connection: connection ?? this.connection,
      selectedImage: selectedImage ?? this.selectedImage,
      userInfo: userInfo ?? this.userInfo,
      errorMessage: errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}