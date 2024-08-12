import 'package:flutter/material.dart';

class Ass5 extends StatelessWidget{
  const Ass5({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container( 

          decoration: const BoxDecoration( 
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.blue
              ],
              stops: [0.5,0.5]
            )
          ),
        ),
      ),
    );
  }
}