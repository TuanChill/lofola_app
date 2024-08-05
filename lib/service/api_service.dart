import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://10.0.2.2:8080/api/v1', // Replace with your base URL
    connectTimeout: const Duration(milliseconds: 3000),
    receiveTimeout: const Duration(milliseconds: 5000),
  ));

  ApiService() {
    // Optional: Add interceptors for logging or modifying requests/responses
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before the request is sent
          print('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options); // Continue
        },
        onResponse: (response, handler) {
          // Do something with the response
          print('Response[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response); // Continue
        },
        onError: (DioError e, handler) {
          // Do something with the error
          print('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          return handler.next(e); // Continue
        },
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      print('Error occurred during GET request: $e');
      rethrow;
    }
  }

  Future<Response> post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? headers}) async {
    try {
      final response =
          await _dio.post(path, data: data, options: Options(headers: headers));
      return response;
    } catch (e) {
      print('Error occurred during POST request: $e');
      rethrow;
    }
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } catch (e) {
      print('Error occurred during PUT request: $e');
      rethrow;
    }
  }

  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response;
    } catch (e) {
      print('Error occurred during DELETE request: $e');
      rethrow;
    }
  }
}
