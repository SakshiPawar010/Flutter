/* Create a Container in the Center of the screen, now In the background of
the Container display an Image (the image can be an asset image or
network image ). Also, display text in the center of the Container.*/

import 'package:flutter/material.dart';

class Ass2 extends StatefulWidget{
  const Ass2({super.key});

  @override 
  State<StatefulWidget> createState() => _Ass2State();
}

class _Ass2State extends State{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Expanded(
          child: Container(
            //height: 200,
            //width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://i.pinimg.com/736x/04/24/12/04241279f5a85323615d383e6a55f151.jpg",
                  //"https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2fc56934073232.56c33cf863075.jpg"
                ),              
              ),
            ),
            child: const Center(
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nature",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Color.fromARGB(255, 127, 212, 243),
                      color: Color.fromARGB(255, 74, 51, 186),
                      shadows: [
                        Shadow(color: Colors.white,offset: Offset(3, 3),blurRadius: 1)
                      ]
                    ),
                  )
                ],
              ),
            ),
          ),  
        ),
      ), 
    );
  }
}