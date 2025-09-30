import 'package:flutter/material.dart';
import 'package:quiz_124230039/screens/loginpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      darkTheme: ThemeData(brightness: Brightness.dark),
    );
  }
}
