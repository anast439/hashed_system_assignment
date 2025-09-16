import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_theme.dart';
import 'package:hashed_system_assignment/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}


