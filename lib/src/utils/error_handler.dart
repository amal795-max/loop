

// These names are retained for compatibility with the generated API template.
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  final Failure failure;

  ErrorHandler.handle(Object error) : failure = map(error);

  static Failure map(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    return UnknownFailure(
      ResponseMessage.DEFAULT,
      error: error,
      code: ResponseCode.DEFAULT,
    );
  }
}

Failure _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure(error: error);
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure(error: error);
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure(error: error);
    case DioExceptionType.badResponse:
      return _failureForResponse(error);
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure(error: error);
    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
      return NetworkFailure(
        ResponseMessage.NO_INTERNET_CONNECTION,
        error: error,
        code: ResponseCode.NO_INTERNET_CONNECTION,
      );
    case DioExceptionType.transformTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure(error: error);
    case DioExceptionType.unknown:
      return UnknownFailure(
        ResponseMessage.DEFAULT,
        error: error,
        code: ResponseCode.DEFAULT,
      );
  }
}

Failure _failureForResponse(DioException error) {
  final response = error.response;
  final statusCode = response?.statusCode;
  final message = _responseMessage(response?.data) ??
      response?.statusMessage ??
      _messageForStatus(statusCode);

  if (statusCode == null) {
    return UnknownFailure(
      message,
      error: error,
      code: ResponseCode.DEFAULT,
    );
  }

  return ServerFailure(message, error: error, code: statusCode);
}

String? _responseMessage(Object? data) {
  if (data is Map) {
    for (final key in const ['message', 'error', 'detail']) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
  }
  if (data is String && data.trim().isNotEmpty) return data.trim();
  return null;
}

String _messageForStatus(int? statusCode) {
  switch (statusCode) {
    case ResponseCode.BAD_REQUEST:
      return ResponseMessage.BAD_REQUEST;
    case ResponseCode.UNAUTHORISED:
      return ResponseMessage.UNAUTORISED;
    case ResponseCode.FORBIDDEN:
      return ResponseMessage.FORBIDDEN;
    case ResponseCode.NOT_FOUND:
      return ResponseMessage.NOT_FOUND;
    case ResponseCode.INTERNAL_SERVER_ERROR:
      return ResponseMessage.INTERNAL_SERVER_ERROR;
    default:
      return ResponseMessage.DEFAULT;
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure({Object? error}) {
    switch (this) {
      case DataSource.SUCCESS:
        return ServerFailure(ResponseMessage.SUCCESS, code: ResponseCode.SUCCESS, error: error);
      case DataSource.NO_CONTENT:
        return ServerFailure(ResponseMessage.NO_CONTENT, code: ResponseCode.NO_CONTENT, error: error);
      case DataSource.BAD_REQUEST:
        return ServerFailure(ResponseMessage.BAD_REQUEST, code: ResponseCode.BAD_REQUEST, error: error);
      case DataSource.FORBIDDEN:
        return ServerFailure(ResponseMessage.FORBIDDEN, code: ResponseCode.FORBIDDEN, error: error);
      case DataSource.UNAUTHORISED:
        return ServerFailure(ResponseMessage.UNAUTORISED, code: ResponseCode.UNAUTHORISED, error: error);
      case DataSource.NOT_FOUND:
        return ServerFailure(ResponseMessage.NOT_FOUND, code: ResponseCode.NOT_FOUND, error: error);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ServerFailure(ResponseMessage.INTERNAL_SERVER_ERROR, code: ResponseCode.INTERNAL_SERVER_ERROR, error: error);
      case DataSource.CONNECT_TIMEOUT:
        return NetworkFailure(ResponseMessage.CONNECT_TIMEOUT, code: ResponseCode.CONNECT_TIMEOUT, error: error);
      case DataSource.CANCEL:
        return NetworkFailure(ResponseMessage.CANCEL, code: ResponseCode.CANCEL, error: error);
      case DataSource.RECIEVE_TIMEOUT:
        return NetworkFailure(ResponseMessage.RECIEVE_TIMEOUT, code: ResponseCode.RECIEVE_TIMEOUT, error: error);
      case DataSource.SEND_TIMEOUT:
        return NetworkFailure(ResponseMessage.SEND_TIMEOUT, code: ResponseCode.SEND_TIMEOUT, error: error);
      case DataSource.CACHE_ERROR:
        return CacheFailure(ResponseMessage.CACHE_ERROR, code: ResponseCode.CACHE_ERROR, error: error);
      case DataSource.NO_INTERNET_CONNECTION:
        return NetworkFailure(ResponseMessage.NO_INTERNET_CONNECTION, code: ResponseCode.NO_INTERNET_CONNECTION, error: error);
      case DataSource.DEFAULT:
        return UnknownFailure(ResponseMessage.DEFAULT, code: ResponseCode.DEFAULT, error: error);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTHORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static String SUCCESS = AppStrings.success.tr(); // success with data
  static String NO_CONTENT =
  AppStrings.success.tr(); // success with no data (no content)
  static String BAD_REQUEST =
  AppStrings.badRequestError.tr(); // failure, API rejected request
  static String UNAUTORISED =
  AppStrings.unauthorizedError.tr(); // failure, user is not authorised
  static String FORBIDDEN =
  AppStrings.forbiddenError.tr(); //  failure, API rejected request
  static String INTERNAL_SERVER_ERROR =
  AppStrings.internalServerError.tr(); // failure, crash in server side
  static String NOT_FOUND =
  AppStrings.notFoundError.tr(); // failure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = AppStrings.timeoutError.tr();
  static String CANCEL = AppStrings.defaultError.tr();
  static String RECIEVE_TIMEOUT = AppStrings.timeoutError.tr();
  static String SEND_TIMEOUT = AppStrings.timeoutError.tr();
  static String CACHE_ERROR = AppStrings.cacheError.tr();
  static String NO_INTERNET_CONNECTION = AppStrings.noInternetError.tr();
  static String DEFAULT = AppStrings.defaultError.tr();
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FALURE = 1;
}


class AppStrings {
  static const String success = 'success';


  // error handler
  static const String badRequestError = 'bad_request_error';
  static const String noContent = 'no_content';
  static const String forbiddenError = 'forbidden_error';
  static const String unauthorizedError = 'unauthorized_error';
  static const String notFoundError = 'not_found_error';
  static const String conflictError = 'conflict_error';
  static const String internalServerError = 'internal_server_error';
  static const String unknownError = 'unknown_error';
  static const String timeoutError = 'timeout_error';
  static const String defaultError = 'default_error';
  static const String cacheError = 'cache_error';
  static const String noInternetError = 'no_internet_error';
  static const String searchServise = 'search_servise';
  static const String moreDetails = 'more_details';
}
