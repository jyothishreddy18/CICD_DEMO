// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Network/response/status.dart';
import '../ViewModel/auth_view_model.dart';
class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final FocusNode emailfocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void initState() {
    _usernameController.text = "967101010879";
    _passwordController.text = "Ptc@123\$";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    var loginResponse = context.read<AuthViewModel>().loginResponse;
    // var load = context.read<AuthViewModel>().loading;
    // var loginResponse = authViewModel.loginResponse;
    // var load = authViewModel.loading;
    if (loginResponse != null) {
      if (loginResponse.status == Status.COMPLETED) {
        var response = loginResponse.data;
        if (kDebugMode) {
          var token = response!.response!.result!.accessToken;
          print(token);
          // var accountId = response.response!.result!.accountId;
          // print(accountId);
          // var accountNumber = response.response!.result!.accountNumber;
          // print(accountNumber);
          // var email = response.response!.result!.email;
          // print(email);
          // var firstName = response.response!.result!.firstName;
          // print(firstName);
          // var mobileNo = response.response!.result!.loginId;
          // print(mobileNo);
          // var profileImage = response.response!.result!.profileImage;
          // print(profileImage);
          // var platForm = response.response!.result!.platform;
          // print(platForm);
          // var lastVisit = response.response!.result!.lastLoginTime;
          // print(lastVisit);
          // var lastName = response.response!.result!.lastName;
          // print(lastName);
        }
      } else if (loginResponse.status == Status.ERROR) {
        var errorMessage = loginResponse.message;
        print(errorMessage);
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login Screen",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black87),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Pressing on icon");
              },
              icon: const Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 20,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.number,
                focusNode: emailfocusNode,
                enableSuggestions: true,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    // hintText: 'Username',
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        fontFamily: 'PtcRegular', color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    prefixIcon: Icon(
                      Icons.person_rounded,
                      color: Colors.black,
                    )),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
              ),
              SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    keyboardType: TextInputType.visiblePassword,
                    obscuringCharacter: "*",
                    cursorColor: Colors.black,
                    style:  TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      // iconColor: Colors.black,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      // hintText: 'Password',
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'PtcRegular', color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.black,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                            _obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          )),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Login button pressing");
                    var data = jsonEncode({
                      "msisdn": _usernameController.text,
                      "password": _passwordController.text,
                      "source": "app"
                    });
                    authViewModel.loginApi(data, context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
