import '../data/models/user_info_model.dart';
import '../data/models/user_model.dart';
import '../imports/imports.dart';
import '../utils/app_urls.dart';
import '../utils/body_params.dart';

class AuthService {
  AuthService._(this._dioService);
  static final AuthService instance = AuthService._(DioService.instance);

  final DioService _dioService;

  FutureEither<String> login(String phone) async {
    final result = await _dioService.post(
      UrlPath.login,
      data: {'phone': phone},
    );

    return result.fold(
          (failure) => left(failure),
          (response) => right(response.data['token']),
    );
  }

  FutureEither<RegisterModel> register(RegisterParams params) async {
    final result = await _dioService.post(
      UrlPath.register,
      data: params.toJson(),
    );
    return result.fold(
          (failure) => left(failure),
          (response) => right(RegisterModel.fromJson(response.data)),
    );
  }

  FutureEither<UserInfoModel> getCurrentUser() async {
    final result = await _dioService.get(
      UrlPath.getInfo,
    );
    return result.fold(
          (failure) => left(failure),
          (response) => right(UserInfoModel.fromJson(response.data)),
    );
  }
}
