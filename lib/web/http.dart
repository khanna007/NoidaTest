import 'package:dio/dio.dart';



Dio http() {
  Dio dio = new Dio();

  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {


    return options; //continue
  }, onResponse: (Response response) async {
    // Do something with response data
    return response; // continue
  }, onError: (DioError e) async {
    // Do something with response error
    return e; //continue
  }));
  dio.options.baseUrl = "http://surekhadesigns.in/json/";
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['accept'] = 'application/json';

  return dio;
}
