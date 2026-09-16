import 'package:fpdart/fpdart.dart';
import 'package:loop/src/data/models/user_model.dart';
import 'package:loop/src/utils/body_params.dart';
import 'package:loop/src/utils/utils.dart';

import '../models/user_info_model.dart';

abstract class AuthRepository {
  Stream<UserInfoModel?> get onAuthStateChanged;
  
  FutureEither<Unit> login({
    required String phone,
  });
  
  FutureEither<RegisterModel> register(RegisterParams params);
  
  // FutureEither<AppUser> updateProfile({
  //   required String fullName,
  //   required String gender,
  //   required String birthDate,
  //   required String bio,
  //   required String connection,
  //   File? image,
  // });
  
  FutureEither<void> logout();
  FutureEither<UserInfoModel?> checkAuthState();
}
