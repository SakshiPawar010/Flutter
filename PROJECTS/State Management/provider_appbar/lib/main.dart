import "dart:developer";
import "package:flutter/material.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    log("In Main App");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Demo"),
        ),
        body: const Center( 
          child: Text("Hello Wolrd!"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
      )
    );
  }
}