import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager_app/categories.dart';
import 'package:expense_manager_app/graphs_screen.dart';
import 'package:expense_manager_app/trash_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child:  Column( 
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                //mainAxisAlignment: ,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      //right: 100
                    ),
                    child: Text("Expense Manager",
                      style: GoogleFonts.poppins( 
                        fontWeight:FontWeight.w600,
                        fontSize:16,
                        color:const Color.fromRGBO(0,0,0,1),                           
                      ),
                    ),
                  ),
                ],
              ),
              Row( 
                children: [ 
                  Padding(
                    padding: const EdgeInsets.only(
                      top:5,
                      left: 20, 
                      //bottom: 10,
                    ),
                    child: Text("Saves all your Transactions",
                      style: GoogleFonts.poppins( 
                        fontWeight:FontWeight.w400,
                        fontSize:10,
                        color:const Color.fromRGBO(0,0,0,5),       
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row( 
                  children: [ 
                    Image.asset("lib/Assets/Images/Subtract.png"),
                    const SizedBox( width: 5,),
                    Text("Transaction",
                      style:GoogleFonts.poppins( 
                        fontWeight:FontWeight.w400,
                        fontSize:16,
                        color:const Color.fromRGBO(14, 161, 125, 1),
                      ) ,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row( 
                  children: [ 
                    Image.asset("lib/Assets/Images/Vector.png"),
                    const SizedBox( width: 5,),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(builder:(context)=> const GraphsScreen())
                          );
                        },
                        child: Container(
                          child: Text("Graphs",
                            style:GoogleFonts.poppins( 
                              fontWeight:FontWeight.w400,
                              fontSize:16,
                              color:const Color.fromRGBO(33, 33, 33, 1),
                            ) ,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row( 
                  children: [ 
                    Image.asset("lib/Assets/Images/Subtract (1).png"),
                    const  SizedBox( width: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder:(context)=> const CategoriesScreen())
                        );
                      },
                      child: Container(
                        child: Text("Category ",
                          style:GoogleFonts.poppins( 
                            fontWeight:FontWeight.w400,
                            fontSize:16,
                            color:const Color.fromRGBO(33, 33, 33, 1),
                          ) ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                  child: Row( 
                    children: [ 
                      Image.asset("lib/Assets/Images/Vector (1).png"),
                      const  SizedBox( width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(builder:(context)=>const TrashScreen()));
                        },
                        child: Container(
                          child: Text("Trash  ",
                            style:GoogleFonts.poppins( 
                              fontWeight:FontWeight.w400,
                              fontSize:16,
                              color:const Color.fromRGBO(33, 33, 33, 1),
                            ) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row( 
                    children: [ 
                      Image.asset("lib/Assets/Images/Vector (2).png"),
                      const  SizedBox( width: 5,),
                      Text("About us ",
                        style:GoogleFonts.poppins( 
                          fontWeight:FontWeight.w400,
                          fontSize:16,
                          color:const Color.fromRGBO(33, 33, 33, 1),
                        ) ,
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}