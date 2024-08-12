/*  Create a Screen with two horizontally aligned containers at the center of the screen. Apply a shadow to each container set individual colors and give a border to the Containers only the bottom edges of the container must be rounded.  */

import 'package:flutter/material.dart';

class Ass3 extends StatelessWidget{
  const Ass3({super.key});
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( 
                color: Colors.black,
                boxShadow: const [ 
                  BoxShadow(offset: Offset(2, 2),color: Colors.blue,blurRadius: 2),
                ],
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                border: Border.all(color: Colors.white,width: 1)
              ),
            ),
            const SizedBox(width: 20,),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration( 
                color: const Color.fromARGB(255, 2, 93, 167),
                boxShadow: const [ 
                  BoxShadow(offset: Offset(2, 2),color: Colors.blue,blurRadius: 2),
                ],
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                border: Border.all(color: Colors.white,width: 1)
              ),
            )
          ],
        ),
      ),
    );
  }
}