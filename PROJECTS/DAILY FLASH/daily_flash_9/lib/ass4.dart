import 'package:flutter/material.dart';

class Ass4 extends StatefulWidget{ 
  const Ass4({super.key});

  @override
  State<Ass4> createState() => _Ass4State();
}


class _Ass4State extends State<Ass4>{
  TextEditingController textEditingController = TextEditingController(); 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( ),

      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            TextField(
              controller: textEditingController,
              decoration: InputDecoration( 
                
                hintText: "Enter your name",
                fillColor: Colors.purple,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: const Text( 
                "Submit"
              )
            )
          ],
        ),
      )
    );
  }
}