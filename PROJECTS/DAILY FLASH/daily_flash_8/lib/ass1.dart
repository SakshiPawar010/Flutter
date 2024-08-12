import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{
  const Ass1({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        actions: const [
          Icon(Icons.circle)
        ],
      ),
      
      body: Padding( 
        padding: const EdgeInsets.all(30),

        child: Column( 
          children: [
            Row( 
              children: [  
                Container(
                  height: 200,
                  width: 150,
                  color: Colors.yellow,
                ),
                const Spacer(),
                Container(
                  height: 200,
                  width: 150,
                  color: Colors.red,
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.green,
            ),
            const Spacer(),
            Row( 
              children: [  
                Container(
                  height: 200,
                  width: 150,
                  color: Colors.purple,
                ),
                const Spacer(),
                Container(
                  height: 200,
                  width: 150,
                  color: Colors.blue,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}