
import 'package:flutter/material.dart';

class QuizDemo extends StatefulWidget{
  const QuizDemo({super.key});

  @override
  State<QuizDemo> createState() => _QuizDemoState();
}

class _QuizDemoState extends State<QuizDemo>{
  bool opt1color = false;
  bool opt2color = false;
  bool opt3color = false;
  bool opt4color = false;

  @override
  Widget  build(BuildContext context){

    return Scaffold(
  
      appBar:AppBar(
        title: (const Text("Quiz App"))
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Text("Next"),
      ),

      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height:20,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,            
            children:[
              Text("Question 1/10"),
            ]
            
          ),

          const SizedBox(
            height:20,
          ),

          const Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("Question 1: What is Flutter?"),
            ],
          ),
          const SizedBox(
            height:20,
          ),

          ElevatedButton(
            onPressed: (){},
            child:const Text("Option 1"),
          ),

          const SizedBox(
            height:20,
          ),

          ElevatedButton(
            onPressed: (){},
            child:const Text("Option 2"),
          ),

          const SizedBox(
            height:20,
          ),

          ElevatedButton(
            onPressed: (){},
            child:const Text("Option 3"),
          ),

          const SizedBox(
            height:20,
          ),

          ElevatedButton(
            onPressed: (){},
            child:const Text("Option 4"),
          ),
        ],
      )
    );
  }
}