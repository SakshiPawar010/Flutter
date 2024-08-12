import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget{ 
  const HomeScreen({super.key});

  @override 
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40,),
          Container(
            width: double.infinity,
            padding:const EdgeInsets.all(27),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text(
                      "Hi Sakshi,",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: const Color.fromARGB(131, 76, 52, 1),
                      ),
                    ),
                    Text(
                      "Great to see you again!",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromARGB(131, 76, 52, 1),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container( 
                  height: 64,
                  width: 64,
                  decoration: const BoxDecoration( 
                    color: Color.fromRGBO(250, 188, 154, 1),
                    shape: BoxShape.circle
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.all(27),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 237, 217, 1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [ 
                Container( 
                  padding: const EdgeInsets.all(18),
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration( 
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "M",
                      style: GoogleFonts.dmSans( 
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(200, 60, 0, 1)
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}