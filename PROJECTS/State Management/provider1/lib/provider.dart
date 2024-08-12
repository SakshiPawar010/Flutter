import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return Provider(
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
  @override
  Widget build(BuildContext context){
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
              onPressed: (){} , 
              child: const Text("Change Company")
            )

            //Trying to change data
            // GestureDetector( 
            //   onTap: () {
            //     setState(() {
            //       Provider.of<Company>(context).companyName = "Meta";
            //     });
            //   },
            //   child: const Text( 
            //     "Change Company"
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Company {
  String companyName;
  int empCount;

  Company({
    required this.companyName,
    required this.empCount
  });
}