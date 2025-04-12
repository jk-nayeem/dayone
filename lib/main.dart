import 'package:dayone/forgotpass.dart';
import 'package:dayone/success.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day One',

      // creating routes for all pages
      routes: {
        '/home': (context) => Homepage(),
        '/dashboard': (context) => Success(),
        '/forgot': (context) => Forgotpass(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // creating controller for both textfield
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void warning(String value) {
    // clearing controller
    _usernameController.clear();
    _passwordController.clear();

    // focusout when submit
    FocusScope.of(context).unfocus();

    // showing warning massage
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid $value'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day One'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple[300],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Here",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",

                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'admin') {
                  if (_passwordController.text == 'password') {
                    Navigator.pushReplacementNamed(
                      context,
                      '/dashboard',
                      arguments: _usernameController.text,
                    );
                  } else {
                    warning("Password");
                  }
                } else if (_usernameController.text == "" &&
                    _passwordController.text == "") {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Can Not be Blank")));
                } else {
                  warning("Username");
                }
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
            ),

            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot');
              },
              child: Text('forgot password ?'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
