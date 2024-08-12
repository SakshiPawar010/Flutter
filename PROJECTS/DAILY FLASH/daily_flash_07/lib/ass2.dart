import 'package:flutter/material.dart';

class Ass2 extends StatelessWidget{
  const Ass2({super.key});

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
        child: Container(
          height: 70,
          width: 250,
          decoration: BoxDecoration( 
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: const Row( 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ 
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 40,
              ),
              Text(
                "Rating: 4.5",
                style: TextStyle( 
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}