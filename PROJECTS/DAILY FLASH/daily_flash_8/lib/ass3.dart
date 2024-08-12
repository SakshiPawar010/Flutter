import 'package:flutter/material.dart';

class Ass3 extends StatelessWidget{
  const Ass3({super.key});

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Daily Flash"),
      ),

      body: Center( 
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( 
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
                ),
                border: Border.all(color: Colors.black,width: 1)
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.black,width: 1)
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( 
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
                border: Border.all(color: Colors.black,width: 1)
              ),
            ),
          ],
        ),
      ),
    );
  }
}