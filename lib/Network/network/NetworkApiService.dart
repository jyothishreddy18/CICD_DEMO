// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  // Login API-------------------------------------------------------------------
  @override
  Future<dynamic> postApiResponse(String url, dynamic data, Map<String, String> headers) async {
    print("postAPI method called");
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data, headers: headers).timeout(  Duration(seconds: 10));
      print('Line Items API duration is running');
      responseJson = returnResponse(response);
      // Response response = await dio.post(AppUrl.loginUrl, data: data,options: Options(headers : headers
      // )).timeout(  const Duration(seconds: 10));
      print('Login API duration is running');
      responseJson = returnResponse(response);
      print(responseJson.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    print(responseJson.toString());
    return responseJson;
  }


  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw UnauthoriseExceptions(response.statusCode.toString());
      case 405:
        throw MethodNotAllowedException(response.statusCode.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with the server with status code ${response.statusCode}');
    }
  }
}
