import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget{
  const Assignment2 ({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Core2Web",
        ), 
        actions: [
          const Icon(
            Icons.favorite_outline_rounded,
          ),
          const Icon(
            Icons.abc_rounded
          )
        ],     
      ),
    );
  }
}