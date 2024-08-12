import 'package:flutter/material.dart';

class Ass5 extends StatelessWidget{
  const Ass5({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue, 
        title: const Text("Daily Flash 05"),
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/8/82/Image_circle.jpg",
              height: 100,
              width: 100,
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