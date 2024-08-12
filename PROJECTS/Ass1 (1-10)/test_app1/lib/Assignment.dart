import 'package:flutter/material.dart';

class Assignment extends StatelessWidget{
  const Assignment({super.key});

  @override
  Widget  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment 1"),
      ),
      body: Center(
        child:
          Container(
            child:              
              const Text("C2W"),
          ) 
          ,
      )
    );
  }
}