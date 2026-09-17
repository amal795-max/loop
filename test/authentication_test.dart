import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loop/src/data/models/user_info_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loop/src/data/models/user_model.dart';
import 'package:loop/src/data/repositories/auth_repository.dart';
import 'package:loop/src/features/auth/providers/auth_provider.dart';
import 'package:loop/src/utils/body_params.dart';
import 'package:loop/src/utils/utils.dart';

// 1. Mocks Definitions
class MockAuthRepository extends Mock implements AuthRepository {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockAuthRepository mockRepository;
  late ProviderContainer container;
  late RegisterParams tParams;
  late RegisterModel tRegisterModel;
  late MockBuildContext mockContext;

  setUpAll(() {
    // تسجيل أنواع البيانات المخصصة لـ Mocktail إذا لزم الأمر
    registerFallbackValue(const AsyncValue.data(null));
  });

  setUp(() {
    mockRepository = MockAuthRepository();
    mockContext = MockBuildContext();

    // إعداد البيانات التجريبية
    tParams = RegisterParams(
      phone: '0500000000',
      userName: 'test_user',
      fullName: 'Test User',
      gender: 'Male',
      birthDate: '1995-05-10',
    );

    tRegisterModel = RegisterModel(
      user: User(id: 1, userName: 'test_user', token: 'fake_jwt_token'),
    );

    // إعداد الـ Riverpod Container مع عمل Override للـ Repository الحقيقي
    container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('AuthNotifier (Riverpod State Management) Tests', () {
    test('Initial state should be AsyncData(null)', () {
      final state = container.read(registerProvider);
      expect(state, const AsyncValue.data(null));
    });

    test('registerUser updates state to loading then success', () async {
      // Arrange
      when(() => mockRepository.register(tParams))
          .thenAnswer((_) async => right(tRegisterModel));

      // Act
      final notifier = container.read(registerProvider.notifier);
      final future = notifier.registerUser(mockContext, tParams);

      // Assert (Loading State)
      expect(container.read(registerProvider), isA<AsyncLoading>());

      await future;

      // Assert (Success State)
      expect(container.read(registerProvider), const AsyncValue.data(null));
      verify(() => mockRepository.register(tParams)).called(1);
    });

    test('registerUser updates state to error when repository fails', () async {
      // Arrange
      const tFailure = ServerFailure('Registration failed');
      when(() => mockRepository.register(tParams))
          .thenAnswer((_) async => left(tFailure));

      // Act
      final notifier = container.read(registerProvider.notifier);
      await notifier.registerUser(mockContext, tParams);

      // Assert
      expect(container.read(registerProvider), isA<AsyncError>());
      final state = container.read(registerProvider) as AsyncError;
      expect(state.error, tFailure);
    });
  });

  group('Logical Flow Tests', () {
    test('checkAuthState returns user when token exists', () async {
      // Arrange
      when(() => mockRepository.checkAuthState())
          .thenAnswer((_) async => right(const UserInfoModel()));

      // Act
      final result = await mockRepository.checkAuthState();

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, tRegisterModel));
    });

    test('checkAuthState returns null when no token found', () async {
      // Arrange
      when(() => mockRepository.checkAuthState())
          .thenAnswer((_) async => right(null));

      // Act
      final result = await mockRepository.checkAuthState();

      // Assert
      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, null));
    });
  });
}