

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage ({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  bool box1Color = false;
  bool box2Color = false;

  Color setBox1Color(){
    if(box1Color == false){
      return Colors.red;
    }else{
      return Colors.black;
    }
  }

  Color setBox2Color(){
    if(box2Color == false){
      return Colors.black;
    }else{
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("Toggle Box"),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                height: 100,
                width: 100,
                color: setBox1Color(),
              ),
              const SizedBox(
                height:20,
              ),
              ElevatedButton(
                onPressed:(){
                  setState(() {
                    if(box1Color == false){
                      box1Color = true;
                    }else{
                      box1Color = false;
                    }
                  });
                },
                child:const Text("Button 1"),
              )
            ]
          ),

          const SizedBox(
            width: 20,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                height:100,
                width:100,
                color: setBox2Color(),
              ), 
              const SizedBox(
                height:20,
              ),              
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    if(box2Color == false){
                      box2Color = true;
                    }else{
                      box2Color = false;
                    }
                  });
                },
                child: const Text("Button 2"),
              )
            ]
          )
        ]
      )
    );
  }
}