import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{
  const Ass1({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text(
          "Daily Flash 07"
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            Container( 
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            Container(
              height: 80,
              width: 80,
              color: Colors.green,
            ),
            Container(
              height: 70,
              width: 80,
              color: Colors.blue,
            )
          ],
        )
      ),
    );
  }
}