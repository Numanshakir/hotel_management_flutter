import 'dart:async';
import '../storage/storage.dart';
import 'network.dart';

class DioInterceptor {
  Dio dio;
  late SharedPreferences prefs;
  bool _isRefreshing =
      false; // To prevent multiple refresh requests simultaneously
  final List<QueuedRequest> _queuedRequests =
      []; // Queue requests during token refresh
  final ErrorHandler _errorHandler = ErrorHandler();

  DioInterceptor(
    this.dio,
  ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Check for token in local database
          String? accessToken = AppSharedPrefs(prefs).getToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          handler.next(options); // Proceed with the request either way
        },
        onResponse: (response, handler) {
          handler.next(response); // Proceed with the response
        },
        onError: (DioException error, handler) async {
          // Check if token exists in the local database
          RequestOptions options = error.requestOptions;

          String? accessToken = AppSharedPrefs(prefs).getToken();

          if (accessToken != null) {
            if (error.response?.statusCode == 401) {
              String? refreshToken = AppSharedPrefs(prefs).getRefreshToken();
              if (!_isRefreshing) {
                _isRefreshing = true;
                if (refreshToken != null) {
                  try {
                    final newAccessToken =
                        await _refreshAccessToken(refreshToken);
                    if (newAccessToken != null) {
                      AppSharedPrefs(prefs).setToken(newAccessToken);
                      for (var queued in _queuedRequests) {
                        queued.options.headers['Authorization'] =
                            'Bearer $newAccessToken';
                        dio
                            .request(
                          queued.options.path,
                          options: Options(
                            method: queued.options.method,
                            headers: queued.options.headers,
                            extra: queued.options.extra,
                          ),
                          data: queued.options.data,
                          queryParameters: queued.options.queryParameters,
                        )
                            .then((res) {
                          queued.completer.complete(res);
                        }).catchError((e) {
                          queued.completer.completeError(e);
                        });
                      }
                      _queuedRequests.clear(); // Clear the queue

                      // Retry the original request
                      handler.resolve(await dio.request(
                        options.path,
                        options: Options(
                          method: options.method,
                          headers: options.headers,
                          extra: options.extra,
                        ),
                        data: options.data,
                        queryParameters: options.queryParameters,
                      ));
                    } else {
                      // If refresh fails, reject the request with an error
                      handler.reject(DioException(
                          requestOptions: options,
                          error: 'Token refresh failed'));
                    }
                  } catch (e) {
                    handler.reject(DioException(
                        requestOptions: options,
                        error: 'Token refresh failed'));
                  } finally {
                    _isRefreshing = false; // Reset refreshing flag
                  }
                } else {
                  handler.reject(DioException(
                      requestOptions: options,
                      error: 'No refresh token available'));
                }
              } else {
                // If token is already being refreshed, queue the request
                final completer = Completer<Response>();
                _queuedRequests.add(QueuedRequest(options, completer));
                return completer.future.then((response) {
                  handler.resolve(response);
                }).catchError((e) {
                  handler.reject(e);
                });
              }
            }
          } else {
            handler.reject(_errorHandler.handleError(error));
          }
        },
      ),
    );
  }

  Future<String?> _refreshAccessToken(String refreshToken) async {
    try {
      final response = await dio.post(
        'https://api.example.com/refresh-token',
        // Replace with your refresh token endpoint
        data: {'refresh_token': refreshToken},
      );
      return response.data['access_token'];
    } catch (e) {
      return null; // Return null if the refresh token request fails
    }
  }
}

class QueuedRequest {
  final RequestOptions options;
  final Completer<Response> completer;

  QueuedRequest(this.options, this.completer);
}
