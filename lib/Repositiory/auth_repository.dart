import 'dart:convert';

import '../Model/LoginResponse.dart';
import '../Network/network/BaseApiServices.dart';
import '../Network/network/NetworkApiService.dart';
import '../Resources/app_urls.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();
  // Login API-------------------------------------------------------------------
  Future<LoginResponse> loginApi(dynamic data) async {
    print("Auth repository, loginApi called");
    try {
      Map<String, String> headers = {
        'correlationId': 'myYt001',
        'operation': 'customerLogin',
        'destination': 'CRM',
        'source': 'WEB',
        'srDate': '16-05-2022',
        'type': 'deviceId',
        'x-lang': 'pt_br',
        'Content-Type': 'application/json',
        'tenancyId': 'MVNO_WEB_PTC',
        'appId': '6a8cf270-c328-3579-b365-9a597de752ab'
      };
      print("Headers are passed into Map for Login API");
      dynamic response = await _apiServices.postApiResponse(AppUrl.loginUrl, data, headers);
      print("Api url, data, headers are passed for Login API");
      print(response.toString());
      Map<String, dynamic> responseData = jsonDecode(response);
      LoginResponse loginResponse = LoginResponse.fromJson(responseData['response']);
      return loginResponse;
    } catch (e) {
      print("Exception at Login API call in AuthRepository");
      throw e;
    }
  }
}


