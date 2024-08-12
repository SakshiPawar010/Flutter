/* Create a Screen in which we will display 3 Containers of Size 100,100 in a Row. Give color to the containers. The containers must divide the free space in the main axis evenly among each other */

import 'package:flutter/material.dart';

class Ass4 extends StatelessWidget{
  const Ass4({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue, 
        title: const Text("Daily Flash 05"),
      ),
      body: Center( 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration( 
                color: Colors.red,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration( 
                color: Colors.green,
              ),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration( 
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}