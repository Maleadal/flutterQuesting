import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // IMPORTANT: COLOR FOR THEME
    // Color.fromRGBO(163, 111, 62, 64),
    // Color.fromRGBO(255, 200, 148, 100),
    // Color.fromRGBO(240, 175, 116, 94),
    // Color.fromRGBO(46, 139, 163, 64),
    // Color.fromRGBO(115, 214, 240, 64)

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 139, 163, 64),
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
            const TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
