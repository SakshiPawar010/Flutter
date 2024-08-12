/* Create a Screen and add your image in the center of the screen below your
image display your name in a container, give a shadow to the Container
and give a border to the container the top left and top right corners must
be circular, with a radius of 20. Add appropriate padding to the container. */

import 'package:flutter/material.dart';

class Ass3 extends StatelessWidget{
  const Ass3({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://w7.pngwing.com/pngs/1002/677/png-transparent-computer-icons-businessperson-female-bussiness-hat-people-monochrome.png", height: 100, width: 100,),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration( 
                color: Colors.black,
                boxShadow:[
                  BoxShadow(offset: Offset(3, 3), color: Colors.amber, blurRadius: 2, )
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20) )
              ),
              child: const Center(
                child: Text(
                  "Sakshi Dashrath Pawar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}