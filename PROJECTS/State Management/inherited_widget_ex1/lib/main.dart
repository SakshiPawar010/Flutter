import 'package:flutter/material.dart';
import 'package:inherited_widget_ex1/login.dart';
//import 'Login.dart';

class ModelData{
  String id;
  String name;
  String username;
  ModelData({ 
    required this.id,
    required this.name,
    required this.username,
  });
  
}

class SharedData extends InheritedWidget{

  ModelData data;
  SharedData({
    super.key,
    required this.data,
    required super.child,
  }); 

  static SharedData of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<SharedData>()!;
  }

  @override 
  bool updateShouldNotify(SharedData oldWidget){ 
    return data != oldWidget.data;
  }
}

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    // return const MaterialApp(
    //   home: LoginPage(),
    //   debugShowCheckedModeBanner: false,
    // );

    return SharedData( 
      // id: "1011",
      // name:"Sakshi",
      // username: "Sakshi_0010",
      data:ModelData(id: "",name: "",username: ""),
   
      child:const MaterialApp( 
        home: LoginPage(),
      ),     
    );
  }
}

