import 'dart:developer';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';


//MultiProvider (Jya app madhe donhi mutable(Provider) aani immutable(ChangeNotifierProvider) data yanch combination garajech ast tya case madhe multiple(combination) providers wrap kele pahijet, list banavli pahije providers chi , ti list ha provider banaun deto tyamule "MultiProvider" sarwat jast use hoto)

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    log("In MyApp Build");
    return MultiProvider(
      providers: [ 
        Provider(
          create:(context) {
            return Employee(empName: "Sakshi", empID: 1);
          },
        ),
        ChangeNotifierProvider(
          create:(context) {
            return Project(projectName: "HealthCare", devType: "Backend");
          },
        ),
      ],
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
    log("In _MainAppState Build");
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: const Text("MultiProvider State Management"),
        centerTitle: true,
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text(Provider.of<Employee>(context).empName),
            const SizedBox(height: 20,),
            Text("${Provider.of<Employee>(context).empID}"),
            const SizedBox(height: 20,),
            Text(Provider.of<Project>(context).projectName),
            const SizedBox(height: 20,),
            Text(Provider.of<Project>(context).devType),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Provider.of<Project>(context, listen:false).changeProject("Alpha", "FrontEnd");        //listen: ha by default true asto
              } , 
              child: const Text("Change Project")
            ),
          ],
        ),
      ),
    );
  }
}


class Employee{
  String empName;
  int empID;

  Employee({required this.empName,required this.empID});
}

class Project with ChangeNotifier{
  String projectName;
  String devType;

  Project({required this.projectName,required this.devType});

  changeProject(String projectName, String devType){
    this.projectName = projectName;
    this.devType = devType;
    notifyListeners();
  }
}