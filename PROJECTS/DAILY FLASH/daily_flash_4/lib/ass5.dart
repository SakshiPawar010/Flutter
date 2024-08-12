import 'package:flutter/material.dart';

class Ass5 extends StatefulWidget{
  const Ass5({super.key});

  State createState() => _Ass5State();
}

class _Ass5State extends State{
  bool isPressed = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center( 

      ),
      floatingActionButton: Center(
        child: InkResponse(
          onLongPress: () {
            setState(() {
              isPressed = true;
            });
          },
          child: FloatingActionButton( 
            backgroundColor: isPressed? Colors.purple : Colors.blue,
            //hoverColor: Colors.purple,
            onPressed: () {
              setState(() {
                isPressed= true;
              });
            },
            child: const Icon(Icons.add, color: Colors.white,),
          ),
        ),
      )
    );
  }
}