import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget{
  const MyTextField({super.key});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField>{
  final TextEditingController _titleEditingController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  final TextEditingController _descriptionEditionController = TextEditingController();
  final FocusNode _descriptionFocusNode = FocusNode();
  //final TextEditingController _dateEditiongController = TextEditingController.Date;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To-do list",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor:const Color.fromARGB(255, 27, 172, 170),
      ),

      body:Center(
        child:Container(
          height: 363,
          width: 360,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), 
              topLeft: Radius.circular(30)
            ),
            border: Border.all(
              color: Colors.blue,
              width: 0.5,
            ),
            /*boxShadow:const [
              BoxShadow(color: Color.fromARGB(162, 255, 255, 255), offset: Offset(20, 20), blurRadius: 8),
              BoxShadow(color: Color.fromARGB(255, 29, 103, 116),offset: Offset(10, 10), blurRadius: 8), 
              BoxShadow(color: Color.fromARGB(172, 33, 149, 243), offset: Offset(5, 5), blurRadius: 8)           
            ],*/
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 28,
                width: 125,
                child:Text(
                  "Create Task",
                  style: GoogleFonts.quicksand(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    //height: 27.5,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: const Alignment(-0.90,0),
                child:SizedBox(
                  height: 14,
                  width: 22,
                  child: Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      //height: 27.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 330,
                /*decoration: const BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1), 
                      offset: Offset(0, 0), 
                      blurRadius: 10, 
                      spreadRadius: 1
                    )
                  ]
                ), */             
                child:TextField(
                  controller: _titleEditingController,
                  focusNode: _titleFocusNode,
                  style: GoogleFonts.quicksand(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                  //textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:const  BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                        width: 0.5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),                 
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Align(
                alignment: const Alignment(-0.90,0),
                child:SizedBox(
                  height: 14,
                  width: 58,
                  child: Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      //height: 27.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
                width: 330,
                child:TextField(
                  controller: _descriptionEditionController,
                  focusNode: _descriptionFocusNode,
                  style: GoogleFonts.quicksand(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                  //textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter Descrioption",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:const  BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                        width: 0.5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),                  
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              
              /*Align(
                alignment: const Alignment(-0.90,0),
                child:SizedBox(
                  height: 14,
                  width: 58,
                  child: Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      //height: 27.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
                width: 330,
                child:TextField(
                  controller: _descriptionEditionController,
                  focusNode: _descriptionFocusNode,
                  style: GoogleFonts.quicksand(
                    color: const Color.fromRGBO(0, 0, 0, 0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                  //textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "Enter Descrioption",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:const  BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                        width: 0.5
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      )
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),                  
                ),
              ),*/
            ],
          ),
        ) ,
      ),
    );
  }
}