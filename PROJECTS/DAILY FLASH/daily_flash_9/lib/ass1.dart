import 'package:flutter/material.dart';

class Ass1 extends StatefulWidget{ 
  const Ass1({super.key});

  @override
  State<Ass1> createState() => _Ass1State();
}

class _Ass1State extends State<Ass1>{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( ),

      body: ListView.builder( 
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder:(context, index) {
          return Row(
            children: [
              Container( 
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                height: 60,
                width: 60,
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}