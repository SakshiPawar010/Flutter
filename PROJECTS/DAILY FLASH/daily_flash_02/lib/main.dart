import 'package:flutter/material.dart';
//import 'package:daily_flash_02/Assignment1.dart';
//import 'package:daily_flash_02/Assignment2.dart';
//import 'package:daily_flash_02/Assignment3.dart';
//import 'package:daily_flash_02/Assignment4.dart';
import 'package:daily_flash_02/Assignment5.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Assignment5(),
    );
  }
}
