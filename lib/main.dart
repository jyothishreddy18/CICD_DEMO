import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/Login.dart';

void main() {
  // ColorConstants.initialize();
  runApp(
    MaterialApp(home: MyApp(),)
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => AuthViewModel()),
    //   ],
    //   child:  MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: LoginScreen());
  }
}
