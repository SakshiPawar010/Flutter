/* 2. Create a screen that displays a container. The container must display an image. Give a circular border only at the bottom of the container. Below the container display the button with size:(width:250, height:70). The button must display “Add to cart”. The color of the button must be purple. Both the container and button must be in the center of the screen. */

import 'package:flutter/material.dart';

class Ass2 extends StatelessWidget{
  const Ass2({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 300,
              width: 250,
              decoration: const BoxDecoration( 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                color: Color.fromARGB(255, 108, 105, 105),
              ),
              child: Image.network("https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/23869882/2023/7/4/bf58b931-1da6-467b-a3e5-133d1118dbcd1688469529787RedTapeMenWhiteWovenDesignSneakers1.jpg")
            ),
            SizedBox(
              height: 70,
              width: 250,
              child: ElevatedButton(
                style: const  ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.purple),
                  ),
                onPressed: (){} , 
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ) 
              ),
            )
          ],
        ),
      ),
    );
  }
}