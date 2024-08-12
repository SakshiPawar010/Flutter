import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main(){
  runApp(const MyApp());
}

class Login{
  String userName;
  String password;
  Login({required this.userName, required this.password});
}

class Employee{
  int empId;
  String empName;
  String userName;
  String password;
  Employee({required this.empId, required this.empName, required this.userName, required this.password});
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider(
          create: (context){ 
            return Login(userName: "sakshi@123", password: "Sakshi@123");
          }
        ),
        ProxyProvider<Login, Employee>( 
          update:(context, login, employee){
            return Employee( 
              empId:12,
              empName:"Sakshi",
              userName:login.userName,
              password: Provider.of<Login>(context).password,
            );
          }
        ),
      ] ,
      child: const MaterialApp( 
        debugShowCheckedModeBanner: false,
        home: MainApp(),
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
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text("Proxy Provider Demo"),
        centerTitle: true,
      ),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Text(Provider.of<Login>(context).userName),
          const SizedBox(height: 20,),
          Text(Provider.of<Login>(context).password),
          const SizedBox(height: 20,),
          Text(Provider.of<Employee>(context).empName),
          const SizedBox(height: 20,),
          Text("${Provider.of<Employee>(context).empId}"),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}