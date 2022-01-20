import 'package:flutter/material.dart';
import 'package:mobile_app/views/profile.dart';
import 'package:mobile_app/views/reset.dart';
import 'views/login.dart';
import 'views/signup.dart';
import 'services/user_service.dart';

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
        '/signup': (context) => const SignUp(),
        '/profile': (context) => const Profile(),
        '/reset': (context) => const ResetPassword()
      },
      home: FutureBuilder(
        future: UserService.getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const Profile();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
