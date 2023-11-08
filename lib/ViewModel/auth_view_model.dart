// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../Model/LoginResponse.dart';
import '../Network/response/api_response.dart';
import '../Repositiory/auth_repository.dart';
class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  //Login API-------------------------------------------------------------------
  final _myRepo = AuthRepository();
  APIResponse<LoginResponse>? _loginResponse;
  APIResponse<LoginResponse>? get loginResponse => _loginResponse;

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoginResponse(APIResponse.loading());
    setLoading(true);

    try {
      LoginResponse response = await _myRepo.loginApi(data);
      setLoading(false);
      if (response.response?.success == "true") {
        print("Login successful !!");
        // successSnackBar(context, "Success", "Welcome "+response.response!.result!.firstName.toString());
        // Future.delayed(const Duration(milliseconds: 1200), () {
          // Navigator.of(context).pop();
          // Navigator.pushReplacement(
          //   context,
          //   PageTransition(
          //     type: PageTransitionType.rightToLeft,alignment: Alignment.center,
          //     duration: const Duration(milliseconds: 1000),
          //     fullscreenDialog: true,
          //     curve: Curves.easeIn,
          //     isIos: true,
          //     opaque: true,
          //     reverseDuration: const Duration(milliseconds: 1000),
          //     child: const DashBoard(), // Your GridDetails widget
          //   ),
          // );
          Navigator.pushReplacementNamed(context, '/dashboard');
        // });
      }else {
        print("Login failed X");
        // failureSnackBar(context, "Failed", "Invalid Username or Password");
      }
      setLoginResponse(APIResponse.completed(response));
    } catch (error) {
      setLoading(false);
      print(error.toString());
      print("Exception at Authview Model at Login API");
      // failureSnackBar(context, "Failed", "Invalid Username or Password");
      setLoginResponse(APIResponse.error(error.toString()));
    }
  }
  void setLoginResponse(APIResponse<LoginResponse> response) {
    _loginResponse = response;
    notifyListeners();
  }
}