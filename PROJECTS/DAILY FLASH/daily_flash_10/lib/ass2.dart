//******************************************************

import 'package:flutter/material.dart';

class Ass2 extends StatelessWidget{ 
  const Ass2({super.key});

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
            gradient: LinearGradient(
              begin:Alignment(0, -0.5),
              end: Alignment(-0.5, 1),
              colors: [Colors.red, Colors.blue]
            )
          ),
        ),
      ),
    );
  }
}