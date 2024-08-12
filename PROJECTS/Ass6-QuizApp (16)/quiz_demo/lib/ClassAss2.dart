import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  bool box1Color = false;
  bool box2Color = false;

  int counter1 = 0;
  int counter2 = 0;

  Color setBox1Color(){
    if(counter1 == 0){
      return Colors.red;
    }else if(counter1 == 1){
      return Colors.green;
    }else if(counter1 == 2){
      return Colors.blue;
    }else if(counter1 == 3){
      return Colors.yellow;
    }else{
      counter1 == 0;
      return Colors.red;
    }
  }

  Color setBox2Color(){
    if(counter2 == 0){
      return Colors.black;
    }else if(counter2 == 1){
      return Colors.red;
    }else if(counter2 == 2){
      return Colors.blue;
    }else if(counter2 == 3){
      return Colors.yellow;
    }else{
      counter2 == 0;
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Box"),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: setBox1Color(),
              ),

              const SizedBox(
                width: 20,
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    counter1++;
                  });
                }, 
                child: const Text("Button 1")
              )
            ],
          ),

          const SizedBox(
            width: 20,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: setBox2Color(),
              ),

              const SizedBox(
                width: 20,
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    counter2++;
                  });
                }, 
                child: const Text("Button 2")
              )
            ],
          )
        ],
      )
    );
  }
}