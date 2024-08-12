import 'package:flutter/material.dart';

class Ass4 extends StatelessWidget{
  const Ass4({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center( 
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            color: Color.fromARGB(216, 249, 242, 198), 
            boxShadow: [ 
              BoxShadow(color: Colors.brown,offset: Offset(-10,-10), blurRadius: 2 )
            ]
          ),
        ),
      ),
    );
  }
}