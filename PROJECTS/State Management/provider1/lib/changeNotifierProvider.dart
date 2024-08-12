import 'dart:developer';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';


//ChangeNotifierProvider   (optimization of provider)

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    log("In MyApp Build");
    return ChangeNotifierProvider(
      create: (context) {
        return Company(companyName: "Google", empCount:250);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  MainApp(),
      ),
    );
  }
}

class MainApp extends StatefulWidget{
  const MainApp({super.key});

  @override 
  State createState() => _MainAppState();
  
}

class _MainAppState extends State{
  String name = "Sakshi";
  @override
  Widget build(BuildContext context){
    log("In _MainAppState Build");
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: const Text("Provider State Management"),
        centerTitle: true,
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text(Provider.of<Company>(context).companyName),
            const SizedBox(height: 20,),
            Text("${Provider.of<Company>(context).empCount}"),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Provider.of<Company>(context, listen:false).changeComapany("faceBook", 500);        //listen: ha by default true asto
              } , 
              child: const Text("Change Company")
            ),
            const SizedBox(height: 20,),
            NormalClass(frndName : name),         //Data ha runtime la yetoy so name madhe change hou shakto so 
          ],
        ),
      ),
    );
  }
}

class NormalClass extends StatelessWidget{
  final String frndName;
  const NormalClass({super.key, required this.frndName});

  //NormalClass({super.key});                     //Ya case madhe object/provider nahi use kela ashi case aste tevha suddha build la call janar
  //return const Text("Hello");                              //ithe build la call janar 

  @override 
  Widget build(BuildContext context){
    log("In NormalClass Build");
    return Text(frndName);
    //return Text(Provider.of<Company>(context).companyName);    //Ithe build la call janar
    //return const Text("Hello");                              //ithe build la call janar nahi
  }
}

class Company extends ChangeNotifier{
  String companyName;
  int empCount;

  Company({
    required this.companyName,
    required this.empCount
  });

  void changeComapany(String companyName, int empCount){
    this.companyName = companyName;
    this.empCount = empCount;
    notifyListeners();              //build la call karayla madat karto jar he method lihili nahi tr data change hotach nahi karan build la call jatach nahi
                                    //like setState but setState calls nearer build and notifyListeners() calls all decendent classes in heirarchy --> pan fakt jya jya decendent classes ne Provider la access kelay tyannachyach build la call jato
  }
}