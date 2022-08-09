import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              hintText: "Enter email",
              contentPadding: EdgeInsets.all(10)),
        ),
        TextField(
          controller: _password,
          enableSuggestions: false,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: "Enter password",
              contentPadding: EdgeInsets.all(10)),
        ),
        TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final userCredentials = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                    email: email, password: password);
                print("Login Successful");
                print(userCredentials);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print("User not found");
                } else if (e.code == 'wrong-password') {
                  print("Wrong password");
                } else {
                  print("Something else happened: ${e.code}");
                }
              } catch (e) {
                print("An Error has Occured: ${e.runtimeType}");
              }
            },
            child: const Text("Login")),
      ],
    );
  }
}