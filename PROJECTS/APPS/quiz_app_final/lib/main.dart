import 'package:flutter/material.dart';
import 'package:quiz_app_final/quizapp.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Start(),
      debugShowCheckedModeBanner:false,
    );
  }
}

class Start extends StatefulWidget {
  const Start({super.key});
  @override
  State createState()=> _StartState();
}

class _StartState extends State {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      appBar: AppBar(
        shadowColor: Colors.black,
          title: Text(
            "QuizApp",
            style: GoogleFonts.yrsa(
              fontSize:30,
              fontWeight:FontWeight.w800,
              color: Colors.yellow,
            ),
          ),
          centerTitle:true,
          backgroundColor:Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [  
              Text(
                "Ready?",                
                style: GoogleFonts.alef(
                  letterSpacing: 2,
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.w800
                ),
              ),
              const SizedBox(
                height: 30,
              ),  

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                  minimumSize:const Size(150, 70),
                  shape: const BeveledRectangleBorder(
                    side:BorderSide(
                      color: Colors.white,
                      width: 2,
                      //style: BorderStyle.solid,
                    ),
                    //borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const QuizApp()));
                  });
                },  
                child: Text("Start Quiz",
                style: GoogleFonts.bigShouldersText(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
                  height: 30,
                ),   
              const Text(
                "Let's check your basic knowledge!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  
                ),
              ),       
            ]
          ),
        ),
    );
  }
}