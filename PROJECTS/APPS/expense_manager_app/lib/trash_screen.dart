import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager_app/drawer.dart';

class TrashScreen extends StatefulWidget{
  const TrashScreen({super.key});
 @override
  State <TrashScreen> createState()=> _TrashScreen();
}

class _TrashScreen extends State<TrashScreen>{
  void showBottomSheet(){}   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        title: Text("Trash",
          style: GoogleFonts.poppins( 
            fontWeight:FontWeight.w500,
            fontSize:16,
            color:const Color.fromRGBO(33, 33, 33, 1)
          ),
        ),
      ), 

      drawer: const MyDrawer(),

      body:ListView.builder(
        // shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Container(
            height: 75,
            width: 361,
            child: Column(
              children: [
                Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ 
                    const Padding(
                      padding: EdgeInsets.only(left:12 , right:12 ),
                      child: Icon(Icons.remove_circle, color: Color.fromRGBO(204, 210, 227, 1), size: 15,),
                      // const SizedBox(width: 10,),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Medicine",
                          style: GoogleFonts.poppins( 
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color.fromRGBO(0,0,0,1)
                          ),                                  
                        ),
                        // const Spacer(),
                        Container(
                          height:30 ,
                          width: 251,
                          child: Text("'Lorem Ipsum is simply dummy text of the printing and typesetting industry... more' ",
                            style: GoogleFonts.poppins( 
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: const Color.fromRGBO(0, 0, 0, 0.8)
                            ),
                          ),
                        ),                            
                      ],
                    ),
                    const Spacer(), 
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //Spacer(),
                        Text(
                          "500",
                          style: GoogleFonts.poppins( 
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black
                          ),  
                        ), 
                        const SizedBox(width: 10,)  
                      ],
                    ),                                                  
                  ],
                ),
                Row( 
                  children: [ 
                    const Spacer(),
                    Text(
                      "3 June | 11:50 AM",
                      style: GoogleFonts.poppins( 
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: const Color.fromRGBO(0, 0, 0, 0.6)
                      ),    
                    ),
                    const SizedBox(width: 10,)
                  ],
                )
              ],
            ),      
          );
        },
      ) ,
    );
  }
}