import 'package:flutter/material.dart';
import 'package:daily_flash_4/ass5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Ass5(),
    );
  }
}