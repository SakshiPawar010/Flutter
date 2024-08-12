import 'package:advanced_quiz_app/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatefulWidget{ 
  const LandingPage({super.key});

  @override 
  State createState() => _LandingPageState();
}

class _LandingPageState extends State{ 
  @override 
  Widget build(BuildContext context){ 
    return Scaffold(

      body: Column(
        children: [
          Stack( 
            children: [ 
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return HomeScreen();
                        }
                      )
                    );
                  });
                },
                child: Image.asset("lib/Images/assets/BG.png",)
              ),
              Positioned(
                left: 90,
                top: 350,
                child: Image.asset("lib/Images/assets/Logo.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}