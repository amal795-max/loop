import 'package:loop/src/data/repositories/auth_repository.dart';
import 'package:loop/src/data/repositories/auth_repository_impl.dart';
import 'package:loop/src/utils/body_params.dart';
import '../../../imports/imports.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});

class RegisterNotifier extends StateNotifier<AsyncValue<void>> {
  RegisterNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> registerUser(BuildContext context, RegisterParams params) async {

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(params);

    result.fold(
          (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        showToast(context, message: failure.message, status: 'error');
      },
          (user) {
        state = const AsyncValue.data(null);
        context.go(AppRoutes.home);
      },
    );
  }
}

final registerProvider = StateNotifierProvider<RegisterNotifier, AsyncValue<void>>(
      (ref) => RegisterNotifier(ref),
);



class LoginNotifier extends StateNotifier<AsyncValue<void>> {
  LoginNotifier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> loginUser({
    required BuildContext context,
    required String phone,
  }) async {
    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(phone: phone);

    result.fold(
          (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        showToast(context, message: failure.message, status: 'error');
      },
          (user) {
        state = const AsyncValue.data(null);
        context.go(AppRoutes.home);
      },
    );
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<void>>(
      (ref) => LoginNotifier(ref),
);


// class UpdateProfileNotifier extends StateNotifier<AsyncValue<void>> {
//   UpdateProfileNotifier(this.ref) : super(const AsyncValue.data(null));
//
//   final Ref ref;
//
//   Future<void> updateProfile({
//     required BuildContext context,
//     required String fullName,
//     required String gender,
//     required String birthDate,
//     required String bio,
//     required String connection,
//     File? image,
//   }) async {
//     state = const AsyncValue.loading();
//
//     final repo = ref.read(authRepositoryProvider);
//     final result = await repo.updateProfile(
//       fullName: fullName,
//       gender: gender,
//       birthDate: birthDate,
//       bio: bio,
//       connection: connection,
//       image: image,
//     );
//
//     result.fold(
//           (failure) {
//         state = AsyncValue.error(failure, StackTrace.current);
//         showToast(context, message: failure.message, status: 'error');
//       },
//           (user) {
//         state = const AsyncValue.data(null);
//         showToast(context, message: 'Profile updated successfully', status: 'success');
//       },
//     );
//   }
// }
//
// final updateProfileProvider = StateNotifierProvider<UpdateProfileNotifier, AsyncValue<void>>(
//       (ref) => UpdateProfileNotifier(ref),
// );
