import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loop/src/utils/body_params.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../imports/core_imports.dart';
import 'profile_state.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ref.read(profileRepositoryProvider));
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(const ProfileState());

  void setFullName(String name) => state = state.copyWith(fullName: name);
  void setGender(String gender) => state = state.copyWith(gender: gender);
  void setBirthDate(String dob) => state = state.copyWith(birthDate: dob);
  void setBio(String bio) => state = state.copyWith(bio: bio);
  void setConnection(String conn) => state = state.copyWith(connection: conn);

  Future<void> pickImage(ImageSource source) async {
    final result = await MediaService.instance.pickImage(source: source);
    result.fold(
      (failure) => state = state.copyWith(errorMessage: failure.message),
      (file) {
        if (file != null) {
          state = state.copyWith(selectedImage: file);
        }
      },
    );
  }

  Future<void> submitProfileUpdate() async {
    state = state.copyWith(isLoading: true, errorMessage: null, isSuccess: false);

    final requestModel = UpdateProfileRequestModel(
      fullName: state.fullName,
      gender: state.gender,
      birthDate: state.birthDate,
      bio: state.bio,
      connection: state.connection,
      image: state.selectedImage,
    );

    final result = await _repository.updateProfile(requestModel);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          isSuccess: false,
        );
      },
      (response) {
        state = state.copyWith(
          isLoading: false,
          userInfo: response.userInfo,
          isSuccess: true,
        );
      },
    );
  }
}