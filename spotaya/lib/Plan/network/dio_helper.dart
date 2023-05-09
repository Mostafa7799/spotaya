import 'dart:developer';

import 'package:dio/dio.dart';
import 'api_constance.dart';
import 'exceptions.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    Duration? timeOut,
  });

  Future<dynamic> get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    Duration? timeOut,
  });
}

class DioHelper implements BaseDioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
    ),
  );

  @override
  Future get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    data,
    Duration? timeOut,
    String? token,
    query,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };

    log('URL => ${dio.options.baseUrl + endPoint}');
    log('Header => ${dio.options.headers.toString()}');
    log('Body => $data');
    log('Query => $query');

    return await request(
        call: () async => await dio.get(
              endPoint,
              cancelToken: cancelToken,
              queryParameters: query,
            ));
  }

  @override
  Future post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    data,
    query,
    Duration? timeOut,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };
    
    log('URL => ${dio.options.baseUrl + endPoint}');
    log('Header => ${dio.options.headers.toString()}');
    log('Body => $data');
    log('Query => $query');

    return await request(
        call: () async => await dio.post(
              endPoint,
              data: data,
              queryParameters: query,
              onSendProgress: progressCallback,
              cancelToken: cancelToken,
            ));
  }
}

extension on BaseDioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      log('Response_Code => ${r.statusCode}');
      log('Response_Data => ${r.data}');

      return r;
    } on DioError catch (e) {
      log('Status_Code => ${e.response!.statusCode}');
      log('Error_Message => ${e.message}');
      log('Error_Error => ${e.error.toString()}');
      log('Error_Type => ${e.type.toString()}');

      throw PrimaryServerException(
          code: e.response?.statusCode ?? 100,
          error: e.error.toString(),
          message: 'Something went wrong!, Please try again later'
          // Here we change it with different APIs
          // message: e.response!.data['status_message'],
          );
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;

      throw PrimaryServerException(
        error: exception.error,
        code: exception.code,
        message: exception.message,
      );
    }
  }
}
