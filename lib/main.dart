import 'package:flutter/material.dart';
import 'package:mobile_app/views/Events/edit_event.dart';
import 'package:mobile_app/views/Events/event_details.dart';
import 'package:mobile_app/views/Events/fetch_events.dart';
import 'package:mobile_app/views/assoc/publish_job.dart';
import 'package:mobile_app/views/articles/publish.dart';
import 'package:mobile_app/views/assoc/signup_assoc.dart';
import 'package:mobile_app/views/auth/settings.dart';
import 'package:mobile_app/views/jobs/fetch_jobs.dart';
import 'views/auth/profile.dart';
import 'views/auth/reset.dart';
import 'views/auth/login.dart';
import 'views/auth/signup.dart';
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
        '/main': (context) => const LoginPage(),
        '/signup': (context) => const SignUp(),
        '/profile': (context) => const Profile(),
        '/reset': (context) => const ResetPassword(),
        '/signupAssoc': (context) => const SignUpAssoc(),
        '/settings': (context) => const AcceuilProfil(),
        '/pushArticle': (context) => const PublishArticle(),
      },
      home: FutureBuilder(
        future: UserService.getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const LoginPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
