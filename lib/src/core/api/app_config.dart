import 'package:loop/src/imports/packages_imports.dart';

import '../../imports/core_imports.dart';
import '../../utils/app_urls.dart';

class AppConfig {
  AppConfig._();
  static late final Dio dio;

  static String get baseUrl => dotenv.get('API_BASE_URL');

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async{
          final result = await SecureStorageService.instance.read(Keys.token);
          result.fold(
                (failure) => null,
                (value) =>options.headers['Authorization'] = 'Bearer $value'
          );

          AppLogger.info('🌐 [DIO] REQUEST[${options.method}] => PATH: ${options.path}');
            AppLogger.info('🌐 [DIO] body[${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.info('✅ [DIO] RESPONSE[${response.statusCode}\n ${response.data}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          AppLogger.error('❌ [DIO] ERROR[${e.response?.statusCode}\n ${e.response?.data}] => PATH: ${e.requestOptions.path}');
          return handler.next(e);
        },
      ),
    );
  }
}
