import 'package:fpdart/fpdart.dart';
import 'package:loop/src/data/models/user_info_model.dart';
import 'package:loop/src/data/models/user_model.dart';
import 'package:loop/src/data/repositories/auth_repository.dart';
import 'package:loop/src/services/auth_service.dart';
import 'package:loop/src/services/secure_storage_service.dart';
import 'package:loop/src/utils/body_params.dart';
import 'package:loop/src/utils/utils.dart';

import '../../utils/app_urls.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _service = AuthService.instance;
  final SecureStorageService _storage = SecureStorageService.instance;

  @override
  FutureEither<Unit> login({required String phone}) async {
    final result = await _service.login(phone);

    return result.fold(
          (failure) => left(failure),
          (responseModel) async {
        final token = responseModel;
        await _storage.write(Keys.token, token);
        return right(unit);
      },
    );
  }


  @override
  FutureEither<RegisterModel> register(RegisterParams params) async {
    final response = await _service.register(params);

    return response.fold(
          (failure) => left(failure),
          (responseModel) async {
        final token = responseModel.user!.token;
        await _storage.write(Keys.token, token!);

        return right(responseModel);
      },
    );
  }

  @override
  FutureEither<void> logout() async {
    await _storage.delete(Keys.token,);
    return right(null);

}
//
// @override
// FutureEither<AppUser> updateProfile(UpdateProfileParams params) async {
//   try {
//     final token = await _storage.read(_tokenKey).then((e) => e.getOrElse(() => null));
//     if (token == null) return left(DataSource.UNAUTHENTICATED.getFailure());
//
//     final response = await _service.updateProfile(
//       token: token,
//       fullName: params.fullName,
//       gender: params.gender,
//       birthDate: params.birthDate,
//       bio: params.bio,
//       connection: params.connection,
//       image: params.image,
//     );
//
//     final currentUser = await checkAuthState().then((e) => e.getOrElse(() => null));
//
//     final updatedUser = currentUser!.copyWith(
//       fullName: response.userInfo.fullName,
//       gender: response.userInfo.gender,
//       birthDate: DateTime.tryParse(response.userInfo.birthDate ?? ''),
//       bio: response.userInfo.bio,
//       connection: response.userInfo.connection,
//       image: response.userInfo.image,
//     );
//
//     return right(updatedUser);
//   } catch (e) {
//     return left(ErrorHandler.handle(e));
//   }
// }
//
@override
FutureEither<UserInfoModel?> checkAuthState() async {
    final response = await _service.getCurrentUser();

    return response.fold(
          (failure) => left(failure),
          (responseModel) async {
        return right(responseModel);
      },
    );
  }

  @override
  // TODO: implement onAuthStateChanged
  Stream<UserInfoModel?> get onAuthStateChanged => throw UnimplementedError();
}

