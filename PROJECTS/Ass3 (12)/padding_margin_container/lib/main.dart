import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:padding_margin_container/Assignment1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    log("In MainApp Build");
    return const MaterialApp(
      home: Assignment1(),
    );
  }
}
