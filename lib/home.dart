import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String email;

  const Home({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(email),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text("Logout"),
          )
        ]),
      ),
    );
  }
}
