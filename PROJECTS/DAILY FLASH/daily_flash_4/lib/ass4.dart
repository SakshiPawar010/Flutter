/* Add a floating action button on the screen and when we hover over the
button the color of the button must become orange.  */

import 'package:flutter/material.dart';

class Ass4 extends StatefulWidget{
  const Ass4({super.key});

  @override
  State createState() => _Ass4State();
}

class _Ass4State extends State{
  bool isPressed = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center(
        child: Text("Hii"),
      ),
      floatingActionButton: InkResponse(
        onTap: (){
          
        },
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (_){
          setState(() {
            isPressed = false;
          });
        },
        child: FloatingActionButton(
            onPressed:(){},
            hoverColor: Colors.orange, 
            backgroundColor: isPressed ? Colors.orange : Colors.blue,
            child: const Icon(Icons.add),
          ),
      ),
    );
  }
}