import 'package:flutter/material.dart';

class Ass3 extends StatefulWidget{
  const Ass3({super.key});

  @override 
  State createState() => _Ass3State();
}

class _Ass3State extends State{
  Color borderColor = Colors.red;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GestureDetector(
          onTap: (){
            setState(() {
              borderColor = Colors.green;
            });
          },
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: 10,
                )
              ),
              child: const Center(
                child: Text(
                  "Click me!",
                ),
              ),
            ),
          ),
      ),
    );
  }
}