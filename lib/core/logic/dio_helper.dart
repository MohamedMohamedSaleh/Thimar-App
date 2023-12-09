import 'package:dio/dio.dart';

class DioHelper {
 final Dio _dio = Dio(BaseOptions(baseUrl: "https://thimar.amr.aait-d.com/api/"));

  Future<ResponseData> sendData({
    required String indPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
   var response =   await _dio.post(
        indPoint,
        data: data
      );
      return ResponseData(message: "تم تسجيل الدخول بنجاح", isSuccess: true, response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: "بيانات الإدخال غير متطابقة معنا", isSuccess: false , response: ex.response );
    }
  }


getData() {}
}


class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
