import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum MenuAction { logout }

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Cancel")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Log out"))
          ],
        );
      }).then((value) => value ?? false);
}

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main - Your Notes"),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLog = await showLogOutDialog(context);
                  if (shouldLog) {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login/', (_) => false);
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                    value: MenuAction.logout, child: Text("Logout")),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            const Text("List of all the Widgets I learned", style: TextStyle(fontSize: 20)),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [ListTile(
                leading: Icon(Icons.smart_button),
                title: Text("Buttons"),
                onTap: () {
                  Navigator.of(context).pushNamed('/buttons/');
                },
              )],
            )
          ],
        ),
      ),
    );
  }
}
