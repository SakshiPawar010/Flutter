import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 

      ),

      body: Center(
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container( 
              child: Image.asset("lib/Assets/Images/Group 77.png"),
            ),
            Expanded(
              child: Container(
                height: 248,
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ 
                    Text("Login to your Account",
                      style: GoogleFonts.poppins( 
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      
                    ),
                    Container(
                      height: 49,
                      width: 280,
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 10, )
                        ]
                      ),
                      child : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField( 
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: GoogleFonts.poppins( 
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                            
                          ),
                          
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: 280,
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.15), blurRadius: 10, )
                        ]
                      ),
                      child : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField( 
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.poppins( 
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                            
                          ),
                          
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){},
                      child: Container( 
                        height: 49,
                        width: 280,
                        decoration: BoxDecoration( 
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromRGBO(14, 161, 125, 1),
                        ),
                        child: Center(
                          child: Text("Sign In",
                            style: GoogleFonts.poppins( 
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white
                            ),
                          )
                        ),
                      ),
                    )

                    // ElevatedButton(
                    //   onPressed: (){}, 
                    //   style: const ButtonStyle( 
                    //     fixedSize: MaterialStatePropertyAll(),
                    //     backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(14, 161, 125, 1)), 
                    //   ),
                    //   child: Text("Sign In",),
                    // )
                  ],
                ),
              ),
            ),
            const Spacer(),

            Text("Don’t have an account? Sign up",
              style: GoogleFonts.poppins( 
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}