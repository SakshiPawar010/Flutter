import 'package:flutter/material.dart';
//import 'splash_screen.dart';
//import 'login_screen.dart';
//import 'register_screen.dart';
import 'transaction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransactionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}