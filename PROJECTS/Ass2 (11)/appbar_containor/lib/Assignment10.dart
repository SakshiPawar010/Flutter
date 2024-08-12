import 'package:flutter/material.dart';

class Assignment10 extends StatelessWidget{
  const Assignment10({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      body: Center(
        child:
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                width: 10,
                color: Colors.red
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20)
              ),
            ),
          ),
      )
    );
  }
}