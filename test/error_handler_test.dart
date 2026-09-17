import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loop/src/utils/error_handler.dart';
import 'package:loop/src/utils/failure.dart';
import 'package:loop/src/utils/task_runner.dart';

void main() {
  group('ErrorHandler', () {
    test('maps an API response to a server failure with its message and code', () {
      final error = DioException.badResponse(
        statusCode: 422,
        requestOptions: RequestOptions(path: '/login'),
        response: Response<dynamic>(
          requestOptions: RequestOptions(path: '/login'),
          statusCode: 422,
          data: {'message': 'Email is already registered'},
        ),
      );

      final failure = ErrorHandler.map(error);

      expect(failure, isA<ServerFailure>());
      expect(failure.code, 422);
      expect(failure.message, 'Email is already registered');
      expect(failure.error, same(error));
    });

    test('maps connection errors to network failures', () {
      final error = DioException.connectionError(
        reason: 'offline',
        requestOptions: RequestOptions(path: '/profile'),
      );

      final failure = ErrorHandler.map(error);

      expect(failure, isA<NetworkFailure>());
      expect(failure.code, ResponseCode.NO_INTERNET_CONNECTION);
      expect(failure.error, same(error));
    });

    test('maps unexpected exceptions to unknown failures', () {
      final error = StateError('unexpected');

      final failure = ErrorHandler.handle(error).failure;

      expect(failure, isA<UnknownFailure>());
      expect(failure.code, ResponseCode.DEFAULT);
      expect(failure.error, same(error));
    });
  });

  test('runTask returns the mapped failure instead of throwing', () async {
    final error = DioException.sendTimeout(
      timeout: const Duration(seconds: 1),
      requestOptions: RequestOptions(path: '/upload'),
    );

    final result = await runTask<void>(() async => throw error);

    result.match(
      (failure) {
        expect(failure, isA<NetworkFailure>());
        expect(failure.code, ResponseCode.SEND_TIMEOUT);
        expect(failure.error, same(error));
      },
      (_) => fail('Expected runTask to return a failure'),
    );
  });
}