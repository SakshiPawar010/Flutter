import 'package:flutter/material.dart';
import 'main.dart';
import 'skillsPage.dart';

class EmployeeInfo extends StatefulWidget{ 
  const EmployeeInfo({super.key});

  @override 
  State createState() => _EmployeeInfoState();
}

class _EmployeeInfoState extends State{ 
  @override
  Widget build(BuildContext context){ 
    SharedData sharedDataObj = SharedData.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("EmployeeInfo",),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text("ID : ${sharedDataObj.data.id}"),
            const SizedBox(height: 10,),
            Text("NAME : ${sharedDataObj.data.name}"),
            const SizedBox(height: 10,),
            Text("USERNAME : ${sharedDataObj.data.username}"),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){ 
                      return const SkillPage();
                    } 
                  )
                );
              }, 
              child: const Text(
                "Add Skills"
              ),
            )
          ],
        ),
      ),
    );
  }
}