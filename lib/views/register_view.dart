import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Enter email", contentPadding: EdgeInsets.all(10)),
          ),
          TextField(
            controller: _password,
            enableSuggestions: false,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "Enter password", contentPadding: EdgeInsets.all(10)),
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  final userCredentials = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  print("Succesfully createed");
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  if (e.code == 'weak-password') {
                    print("Your passworde was weak");
                  } else if (e.code == 'email-already-in-use') {
                    print("Your email is already registered to an account");
                  } else if (e.code == 'invalid-email') {
                    print("Your email was invalid");
                  }
                } catch (e) {
                  print("Error: ${e.runtimeType}");
                }
              },
              child: const Text("Register")),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login/', (route) => false);
              },
              child: const Text("Already have an account? Log in"))
        ],
      ),
    );
  }
}
