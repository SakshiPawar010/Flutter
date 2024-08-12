import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 

      ),

      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  height: 144,
                  width: 144, 
                  decoration: const BoxDecoration( 
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(234, 238, 235, 1),
                  ),
                  child: Center(child: Image.asset("lib/Assets/Images/Group 77.png")),
                ),
              ),
            ),
            //const Spacer(),
            
            Text("Expense Manager",
              style: GoogleFonts.poppins( 
                  fontWeight: FontWeight.w600,
                  fontSize: 16 ,
                  color: Colors.black
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}