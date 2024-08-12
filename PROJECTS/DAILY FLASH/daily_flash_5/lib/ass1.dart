/* Create a Screen, in the appBar display "Profile Information". In the body,display an image of size (height: 250 width:250). Below the image add
appropriate spacing and then display the user Name and Phone Number
vertically. The name and phone number must have a font size of 16 and a font
weight of 500. */

import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{
  const Ass1({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Profile Information",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/5231/5231019.png",
              height: 250,
              width: 250,
            ),
            const Padding(
              padding:EdgeInsets.all(10),
              child: Text(
                "Name: Sakshi Pawar",
              ),               
            ),
            const Text(
              "Ph.No. : 2892392393"
            )
          ],
        ),
      ),
    );
  }
}