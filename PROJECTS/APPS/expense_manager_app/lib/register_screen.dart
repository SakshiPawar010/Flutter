import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget{
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 

      ),

      body: Center(
        child: Column( 
          children: [
            Image.asset("lib/Assets/Images/Group 77.png"),
            
            const SizedBox(height: 50,),

            Container(
              height:390 ,
              width: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ 
                  Text("Create your Account",
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
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
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
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                        child: Text("Sign Up",
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
            const Spacer(),

            Text("Already have an account? Sign In",
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