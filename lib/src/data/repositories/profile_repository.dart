import '../../imports/imports.dart';
import '../../services/profile.service.dart';
import '../../utils/body_params.dart';
import '../models/user_info_model.dart';

abstract class ProfileRepository {
  FutureEither<UpdateProfileModel> updateProfile(UpdateProfileRequestModel request,);}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl({
    ProfileService? profileService,
    SecureStorageService? storageService,
  })  : _profileService = profileService ?? ProfileService.instance;
  @override
  FutureEither<UpdateProfileModel> updateProfile(UpdateProfileRequestModel request) async {
    final response = await _profileService.updateProfile(request);

    return response.fold(
          (failure) => left(failure),
          (responseModel) async {return right(responseModel);
      },
    );
  }
}