import 'package:flutter/material.dart';

class Ass2 extends StatefulWidget{
  const Ass2({super.key});

  @override
  State createState() => _Ass2State();
}

class _Ass2State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed:(){} , 
          style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(200, 200)),
            //fixedSize: MaterialStatePropertyAll(Size.fromWidth(200)),
            side: MaterialStatePropertyAll(BorderSide(color: Colors.red, width: 1))
          ),
          child: const Text("Click me!")
        ),
      ),
    );
  }
}