import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget{
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _Assignment1State();
}

class _Assignment1State extends State<Assignment1>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Core2Web",
        ),
        actions: [
          const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
          const Icon(
            Icons.alarm,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}