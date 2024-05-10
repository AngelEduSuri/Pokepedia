import 'package:dio/dio.dart';

class ApiService {
  ApiService._();

  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
    ),
  );

  static Dio getApi() => _dio;
}
