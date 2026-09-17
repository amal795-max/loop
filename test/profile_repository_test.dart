import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loop/src/data/models/user_info_model.dart';
import 'package:loop/src/data/repositories/profile_repository.dart';
import 'package:loop/src/services/profile.service.dart';
import 'package:loop/src/utils/body_params.dart';
import 'package:loop/src/utils/utils.dart';
import 'package:mocktail/mocktail.dart';

class MockProfileService extends Mock implements ProfileService {}

void main() {
  late MockProfileService mockService;
  late ProfileRepositoryImpl repository;

  setUp(() {
    mockService = MockProfileService();
    repository = ProfileRepositoryImpl(profileService: mockService);
  });

  group('ProfileRepository.updateProfile', () {
    const request = UpdateProfileRequestModel(
      fullName: 'Ahmed Ali',
      gender: 'Male',
      birthDate: '1995-05-10',
      bio: 'Hello world',
      connection: 'Online',
    );

    const successModel = UpdateProfileModel(
      message: 'Success',
      userInfo: UserInfoModel(
        id: 9,
        fullName: 'Ahmed Ali',
        gender: 'Male',
      ),
    );

    test('should return UpdateProfileModel when service call is successful', () async {
      // Arrange
      when(() => mockService.updateProfile(request))
          .thenAnswer((_) async => right(successModel));

      // Act
      final result = await repository.updateProfile(request);

      // Assert
      expect(result, right(successModel));
      verify(() => mockService.updateProfile(request)).called(1);
    });

    test('should return Failure when service call fails', () async {
      // Arrange
      const failure = ServerFailure( 'Server Error', code: 500);
      when(() => mockService.updateProfile(request))
          .thenAnswer((_) async => left(failure));

      // Act
      final result = await repository.updateProfile(request);

      // Assert
      expect(result, left(failure));
      verify(() => mockService.updateProfile(request)).called(1);
    });
  });
}
