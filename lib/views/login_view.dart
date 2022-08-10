import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/notes/', (route) => false);
                } on FirebaseAuthException catch (e) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          errorPopup(context, e.code));
                } catch (e) {
                  print("An Error has Occurred: ${e.runtimeType}");
                }
              },
              child: const Text("Login")),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: const Text("Not Registered yet? Register here!"))
        ],
      ),
    );
  }
}

Widget errorPopup(BuildContext context, String e) {
  return AlertDialog(
    title: const Text("Error", style: TextStyle(color: Colors.red)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("An Error has Occured: ${e}"),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Try again"))
      ],
    ),
  );
}
