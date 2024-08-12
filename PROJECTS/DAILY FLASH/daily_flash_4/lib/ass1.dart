import 'package:flutter/material.dart';

class ass1 extends StatefulWidget{
  const ass1({super.key});
  @override 
  State createState() => _ass1State();
}

class _ass1State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){}, 
          style: const ButtonStyle( 
            shadowColor: MaterialStatePropertyAll(Colors.red),            
          ),
          child: const Text("Click me!"),
          ),
      ),
    );
  }
}