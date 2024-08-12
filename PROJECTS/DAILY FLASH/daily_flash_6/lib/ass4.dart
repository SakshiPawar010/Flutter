import 'package:flutter/material.dart';

class Ass4 extends StatelessWidget{
  const Ass4({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.black, width: 1,)
              ),
              child : Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration( 
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Container( 
                              height: 90,
                              width:90,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration( 
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Container( 
                              height: 90,
                              width:90,
                              color: Colors.purple,
                            ),
                          ),
                        ]
                      )
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}