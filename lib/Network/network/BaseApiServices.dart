// ignore_for_file: file_names

abstract class BaseApiServices {
  // Login API
  Future<dynamic> postApiResponse(String url, dynamic data, Map<String, String> headers);
}



