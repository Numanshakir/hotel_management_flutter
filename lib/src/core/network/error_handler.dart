// error_handler.dart



import 'network.dart';

class ErrorHandler {
  DioException handleError(DioException error) {
    String errorMessage = 'Unknown error';
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Connection timed out';
    } else if (error.type == DioExceptionType.badResponse) {
      switch (error.response?.statusCode) {
        case 400:
          errorMessage = 'Bad request';
          break;
        case 401:
          errorMessage = 'Unauthorized';
          break;
        case 500:
          errorMessage = 'Server error';
          break;
        default:
          errorMessage = 'Something went wrong';
      }
    } else if (error.type == DioExceptionType.unknown) {
      errorMessage = 'No internet connection';
    }
    return DioException(requestOptions: error.requestOptions, error: errorMessage);
  }
}
