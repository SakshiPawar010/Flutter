import 'package:flutter/material.dart';
import 'employeeInfo.dart';
import 'main.dart';

class LoginPage extends StatefulWidget{ 
  const LoginPage({super.key});

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();

//List loginInfo = [];

class _LoginPageState extends State<LoginPage>{
  @override 
  Widget build(BuildContext context){ 
    SharedData sharedDataObj = SharedData.of(context);

    return Scaffold( 
      appBar: AppBar( 
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            const Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
        
            const SizedBox(height: 10,),
        
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                hintText: "Enter your ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
        
            const SizedBox(height: 10,),
        
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter your Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
        
            const SizedBox(height: 10,),
        
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Enter your userName",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
        
            const SizedBox(height: 10,),
        
            ElevatedButton(
              onPressed: (){
                //sharedDataObj.data: (id: idController.text, name: nameController.text, userName:usernameController.text);
                sharedDataObj.data.id =idController.text;
                sharedDataObj.data.name = nameController.text;
                sharedDataObj.data.username = usernameController.text;
                // // setState(() {                                
                //   SharedData(
                //     data:ModelData(id: idController.text, name: nameController.text, username: usernameController.text),
                //     child: const EmployeeInfo(),
                    
                //  );
                 print("Data added ${sharedDataObj.data.id}, ${sharedDataObj.data.name}, ${sharedDataObj.data.username} ");
                 
                //});
               
                
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){ 
                      return const EmployeeInfo();
                    }
                  )
                );
              }, 
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 16,
                ),
              )
            )
        
          ],
        ),
      ),
    );
  }
}