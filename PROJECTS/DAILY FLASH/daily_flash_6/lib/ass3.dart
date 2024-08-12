import 'package:flutter/material.dart';

class Ass3 extends StatelessWidget{
  const Ass3({super.key});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration( 
                    color: Colors.red
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration( 
                    color: Colors.orange,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration( 
                    color: Colors.purple
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration( 
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}