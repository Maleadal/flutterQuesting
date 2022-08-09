import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_project/views/login_view.dart';
import 'package:test_project/views/register_view.dart';
import 'package:test_project/views/verify_email_view.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(title: "Flutter Demo", home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home"),
        ),
        body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if (user == null) {
                  return Column(
                    children: [
                      const Text("Please Register or Login before accessing this page\n\n"),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const RegisterView()));
                        },
                        child: const Text("Register"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => const LoginView()));
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  );
                }
                // final isVerified = user?.emailVerified ?? false;
                // if (isVerified) {
                //   print("You are a verified user");
                // } else {
                //   return const VerifyEmailView();
                // }
                return const Text('Done');
              default:
                return const Text("Loading");
            }
          },
        ));
  }
}
