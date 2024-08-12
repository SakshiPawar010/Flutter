/* 1. Create a screen that displays an asset image of the food item at the top of the
Screen, below the image, display the name of the food item and below the name
give the description of the item. Add appropriate padding. */

import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{
  const Ass1({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: const Text(
          "Daily Flash 06",
        ),
      ),

      body: Column( 
        children: [ 
          Image.asset(
            "lib/assets/Images/classic-cheese-pizza-recipe-2-64429a0cb408b.jpg",
            width: double.infinity,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text( 
                  "Pizza",
                  style: TextStyle( 
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text( 
                  "A large circle of flat bread baked with cheese, tomatoes, and vegetables spread on top.",
                  style: TextStyle( 
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}