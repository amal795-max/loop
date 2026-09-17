//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:loop/src/utils/app_urls.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:dio/dio.dart';
//
// import 'package:loop/src/services/profile.service.dart';
// import 'package:loop/src/data/models/user_info_model.dart';
// import 'package:loop/src/utils/body_params.dart';
// import 'package:loop/src/services/dio_service.dart';
//
// class MockDio extends Mock implements Dio {}
// class MockDioService extends Mock implements DioService {}
//
// void main() {
//   late MockDio dio;
//   late MockDioService dioService;
//   late ProfileService service;
//
//   setUp(() {
//     dio = MockDio();
//     dioService = MockDioService();
//     service = ProfileService._(dioService);
//   });
//
//   group('ProfileService.updateProfile', () {
//     test('returns UpdateProfileModel on success (200)', () async {
//       // Arrange
//       const request = UpdateProfileRequestModel(
//         fullName: 'Amal',
//         gender: 'Female',
//         birthDate: '1995-05-10',
//         bio: 'Hello world',
//         connection: 'Online',
//       );
//
//       final fakeResponse = Response(
//         data: {
//           'userInfo': {
//             'fullName': 'Amal',
//             'gender': 'Female',
//           }
//         },
//         statusCode: 200,
//         requestOptions: RequestOptions(path: UrlPath.editInfo),
//       );
//
//       when(() => dioService.post(
//         UrlPath.editInfo,
//         data: request,
//       )).thenAnswer((_) async => right(fakeResponse));
//
//       // Act
//       final result = await service.updateProfile(request);
//
//       // Assert
//       expect(result.isRight(), true);
//       result.fold(
//             (_) => fail('Should not fail'),
//             (model) {
//           expect(model.userInfo.userInfo?.fullName, 'Amal');
//           expect(model.userInfo.userInfo?.gender, 'Female');
//         },
//       );
//     });
//
//     test('returns Failure on 404 error', () async {
//       // Arrange
//       const request = UpdateProfileRequestModel(
//         fullName: 'Amal',
//         gender: 'Female',
//         birthDate: '1995-05-10',
//         bio: 'Hello world',
//         connection: 'Online',
//       );
//
//       final fakeError = Failure(
//         message: 'Not found',
//         code: 404,
//       );
//
//       when(() => dioService.post(
//         UrlPath.editInfo,
//         data: any(named: 'data'),
//       )).thenAnswer((_) async => left(fakeError));
//
//       // Act
//       final result = await service.updateProfile(request);
//
//       // Assert
//       expect(result.isLeft(), true);
//       result.fold(
//             (failure) {
//           expect(failure.code, 404);
//           expect(failure.message, 'Not found');
//         },
//             (_) => fail('Should not succeed'),
//       );
//     });
//
//     test('returns Failure on server error (500)', () async {
//       // Arrange
//       const request = UpdateProfileRequestModel(
//         fullName: 'Amal',
//         gender: 'Female',
//         birthDate: '1995-05-10',
//         bio: 'Hello world',
//         connection: 'Online',
//       );
//
//       final fakeError = Failure(
//         message: 'Internal server error',
//         code: 500,
//       );
//
//       when(() => dioService.post(
//         UrlPath.editInfo,
//         data: any(named: 'data'),
//       )).thenAnswer((_) async => left(fakeError));
//
//       // Act
//       final result = await service.updateProfile(request);
//
//       // Assert
//       expect(result.isLeft(), true);
//       result.fold(
//             (failure) {
//           expect(failure.code, 500);
//           expect(failure.message, 'Internal server error');
//         },
//             (_) => fail('Should not succeed'),
//       );
//     });
//   });
// }
