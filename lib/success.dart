import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    // getting the username passed through routes
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Successfully Logged Out")),
              );
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pushReplacementNamed(context, '/home');
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome $username",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
