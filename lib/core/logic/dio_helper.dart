import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vegetable_orders_project/core/logic/cache_helper.dart';
import 'package:vegetable_orders_project/generated/locale_keys.g.dart';

class DioHelper {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "", headers: {
    'Accept': 'application/json',
    'Authorization': "Bearer ${CacheHelper.getUserToken()}",
    'Accept-Language': LocaleKeys.lang.tr(),
  }));

  Future<ResponseData> sendData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.post(
        endPoint,
        data: FormData.fromMap(data ?? {}),
      );
      return ResponseData(
          message: (response.data.toString()).isNotEmpty
              ? response.data['message']
              : '',
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response!.data["message"],
          isSuccess: false,
          response: ex.response);
    }
  }

  static MultipartFile convertPathToMultiPart({required String imagePath}) {
    return MultipartFile.fromFileSync(imagePath,
        filename: imagePath.split('/').last);
  }

  Future<ResponseData> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.delete(endPoint, data: data);
      return ResponseData(
          message: response.data['message'],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response?.data["message"]??'Error Connection!',
          isSuccess: false,
          response: ex.response);
    }
  }

  Future<ResponseData> getData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: data);
      return ResponseData(
          message: response.data["message"] ?? '',
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response?.data["message"]??'Error Connection!',
          isSuccess: false,
          response: ex.response);
    }
  }

  Future<ResponseData> updateData({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      var response = await _dio.put(endPoint, data: data);
      return ResponseData(
          message: response.data["message"],
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response?.data["message"]??'Error Connection!',
          isSuccess: false,
          response: ex.response);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
