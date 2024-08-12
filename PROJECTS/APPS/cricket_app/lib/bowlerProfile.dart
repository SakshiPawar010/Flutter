

// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cricket_app/bowler.dart';

class BowlerAllInfo extends StatefulWidget {
  const BowlerAllInfo({super.key, required this.bowlerInfo});

  final BowlerModelClass bowlerInfo;

  @override
  State createState()=> _BowlerAllInfoState();
}

class _BowlerAllInfoState extends State<BowlerAllInfo> {

  late BowlerModelClass bowlerInfo;
  @override
  void initState() {
    super.initState();
    bowlerInfo = widget.bowlerInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200,200,200,1),
      body: Column(
        children: [

          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(bowlerInfo.playerName,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(
                height: 50,
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromRGBO(255,232,249,1),
                  image: DecorationImage(
                    image: NetworkImage(bowlerInfo.playerImage,
                    ),
                    fit: BoxFit.fitHeight,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(bowlerInfo.playerName,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(bowlerInfo.country,
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(0,0,0,0.7),
                  fontSize: 20,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("PERSONAL INFORMATION",
                  style: GoogleFonts.quicksand( 
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            
              // Born
              Container(
                padding: const EdgeInsets.only(left: 15),
                height: 35,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Born",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0,0,0,0.7),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 96,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(bowlerInfo.born,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0,0,0,1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            
              // Birth Place
              Container(
                padding: const EdgeInsets.only(left: 15),
                height: 35,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Birth Place",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0,0,0,0.7),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(bowlerInfo.birthPlace,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(0,0,0,1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            
              // Nickname
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 35,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Nickname",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 55,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(bowlerInfo.nickName,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),  
            
                // Role
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 35,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Role",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 96,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(bowlerInfo.role,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
            
                // Batting style
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 35,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Batting Style",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 33,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(bowlerInfo.battingStyle,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
            
                // Bowling Style
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 35,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Bowling Style",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,0.7),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(bowlerInfo.bowlingStyle,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(0,0,0,1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          
        ],
      ),
    );
  }
}