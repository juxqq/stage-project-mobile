import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messenger Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/main': (context) => const Login(),
          '/signup' : (context) => const SignUp(),
        },
        home: const Login()
    );
  }
}
