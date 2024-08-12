
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cricket_app/batsman.dart';
import 'package:cricket_app/bowler.dart';
import 'package:cricket_app/allRounder.dart';
import 'package:cricket_app/batsmanProfile.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override 
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State{

  void _navigateToBatsmanPage(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const Batsman())
    );
  }

  void _navigateToBowlerPage(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const Bowler())
    );
  }

  void _navigateToAllRounderPage(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const AllRounder())
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar( 
        title: Text(
          "CricketerInfo",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize:25,
          ),
        ),
        centerTitle: true,
        //backgroundColor: const Color.fromRGBO(1,87, 155, 1),
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration( 
              color: Colors.blue,
              boxShadow: [ 
                BoxShadow(offset: Offset(10, 10), color: Colors.black, blurRadius: 4)
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                "lib/assets/Images/cricket.png",
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child:Container(
              width: double.infinity,
              decoration: const BoxDecoration( 
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                // boxShadow: [
                //   BoxShadow(offset: Offset(-10 , -10), color: Colors.white, blurRadius: 10)
                // ]
              ),
              child: SingleChildScrollView(
                child: Column( 
                  children: [
                    GestureDetector(
                      onTap: (){
                        _navigateToBatsmanPage();
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.all(20),
                        //padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration( 
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //border: Border.all(width: 1, color: Colors.white),
                          boxShadow: [ 
                            BoxShadow(
                              color: Colors.white, 
                              offset: Offset(1,2), 
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ]
                        ),
                        child: Row( 
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "Batsman",
                                style: GoogleFonts.quicksand( 
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "lib/assets/Images/bat1.png",
                              width: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                
                    GestureDetector(
                      onTap: (){
                        _navigateToBowlerPage();
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.all(20),
                        //padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration( 
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //border: Border.all(width: 1, color: Colors.white),
                          boxShadow: [ 
                            BoxShadow(
                              color: Colors.white, 
                              offset: Offset(1,2), 
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ]
                        ),
                        child: Row( 
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "Bowler",
                                style: GoogleFonts.quicksand( 
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "lib/assets/Images/Bowler1.png",
                              //width: 100,
                              //"lib/assets/Images/bowlfinal-fotor-bg-remover-20240313231748.png",
                            )
                          ],
                        ),
                      ),
                    ),
                
                    GestureDetector(
                      onTap: (){
                        _navigateToAllRounderPage();
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.all(20),
                        //padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration( 
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          //border: Border.all(width: 1, color: Colors.white),
                          boxShadow: [ 
                            BoxShadow(
                              color: Colors.white, 
                              offset: Offset(1,2), 
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ]
                        ),
                        child: Row( 
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                "AllRounder",
                                style: GoogleFonts.quicksand( 
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white
                                ),
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "lib/assets/Images/allRounder.png",
                              //width: 100,
                              //height: 150,
                            )
                          ],
                        ),
                      ),
                    )
                  
                  
                  ],
                ),
              ),
            ) 
          )
        ],
      ),
    );
  }
}