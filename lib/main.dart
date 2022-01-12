import 'package:flutter/material.dart';
import 'package:mobile_app/views/profile.dart';
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
          '/profile': (context) => const Profile(),
        },
        home: const Login()

    );
  }
}
