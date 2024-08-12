import 'package:flutter/material.dart';
import 'package:daily_flash_3/ass5.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Ass5(),
      debugShowCheckedModeBanner: false,
    );
  }
}
