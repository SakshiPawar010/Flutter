import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget{
  const Assignment2({super.key});

  @override
  State createState() => _Assignment2State();
}

class _Assignment2State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person),
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          "Core2Web"
        ),
        actions: const [
          Icon(Icons.add),
          Icon(Icons.favorite_border),
          Icon(Icons.notification_add_outlined),
        ],
      ),
    );
  }
}