
import 'dart:io';
import 'network.dart';

class DioHelper {
  final Dio dio;
  final DioInterceptor dioInterceptor;

  DioHelper({required this.dio,})
      : dioInterceptor = DioInterceptor(dio,);

  Future<Response> sendRequest(
      String path, {
        required String method,
        var  data,
        Map<String, dynamic>? queryParameters,
        bool requiresAuth = false,
        CancelToken? cancelToken,
        Map<String, File>? files,
      }) async {
    try {
      if (files != null && files.isNotEmpty) {
        FormData formData = FormData.fromMap(data ?? {});
        for (String fieldName in files.keys) {
          formData.files.add(
            MapEntry(
              fieldName,
              await MultipartFile.fromFile(files[fieldName]!.path,
                  filename: files[fieldName]!.path.split('/').last),
            ),
          );
        }
        data = formData;
      }

      final response = await dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          contentType: files != null ? 'multipart/form-data' : null,
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (error) {
      if (CancelToken.isCancel(error)) {
        throw 'Request cancelled';
      }
      throw ErrorHandler().handleError(error);
    }
  }
}
