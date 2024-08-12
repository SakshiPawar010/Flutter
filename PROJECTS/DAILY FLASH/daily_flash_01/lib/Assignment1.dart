import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget{
  const Assignment1({super.key});
  @override
  State createState() => _Assignment1State();
}

class _Assignment1State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        centerTitle: true,
        title: const Text(
          "Core2Web",
        ),
        actions: const [
          Icon(Icons.notification_add_outlined)
        ],
      ),
    );
  }
}