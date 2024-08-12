************************************************

/* 5. Create a Screen in which we have 3 Containers with size:(height:100,width:200) placed vertically. Each container must have a black border. Initially, the Color of the Containers must be white. The container that is tapped must change its color to red and other containers must be white */

import 'package:flutter/material.dart';

class Ass5 extends StatefulWidget{
  const Ass5({super.key});

  State createState() => _Ass5Sate(); 
}

Widget createContainer(int index, int selectedIndex){
  return GestureDetector( 
    onTap:() {selectedIndex = index;},
    child: Container( 
      height: 100,
      width: 200,
      decoration: BoxDecoration( 
        border: Border.all(color: Colors.black, width: 1),
        color: selectedIndex == index ? Colors.red : Colors.white,
      ),
    ),
  );
}

class _Ass5Sate extends State {
  int selectedIndex = -1;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        title: const Text( 
          "Daily Flash 06",
        ),
      ),

      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createContainer(0, selectedIndex),
            createContainer(1, selectedIndex),
            createContainer(2, selectedIndex),
          ],
        ),
      ),
    );
  }
}