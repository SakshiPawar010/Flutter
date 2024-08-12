import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{ 
  const Ass1({super.key});

  @override 
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Daily Flash"),
      ),

      body: Center( 
        child: Container( 
          height: 100,
          width: 100,
          decoration: const BoxDecoration( 
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue]
            )
          ),
        ),
      ),
    );
  }
}