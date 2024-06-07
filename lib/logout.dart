import 'package:flutter/material.dart';
import 'package:project_if22a/screen/login.dart';

void main() {
  runApp(Logout());
}

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
