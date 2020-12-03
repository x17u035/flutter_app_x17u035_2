import 'package:flutter/material.dart';
import './test/user_login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase CookBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailSignInForm(),
    );
  }
}
