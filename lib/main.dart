import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_project/views/login_view.dart';
import 'package:test_project/views/notes_view.dart';
import 'package:test_project/views/register_view.dart';
import 'package:test_project/views/verify_email_view.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: "Flutter Demo",
    home: const HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
      '/verify/': (context) => const VerifyEmailView(),
      '/notes/': (context) => const NotesView()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              return const LoginView();
            }
            final isVerified = user.emailVerified;
            if (isVerified) {
              return const NotesView();
            } else {
              return const VerifyEmailView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}


