import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
//import 'package:cricket_app/batsman.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class LoginModelClass{
  String? userName;
  String? password;

  LoginModelClass(
    {
      required this.userName,
      required this.password
    }
  );

  Map<String, dynamic> mapLogin(){
    return{
      'userName': userName,
      'password': password
    };
  }

  @override 
  String toString() {
    return '''{
      userName: $userName,
      password: $password
    }''';
  }
}

List loginInfoList = [];
class _LoginPageState extends State<LoginPage> {
  dynamic database;

  @override
  void initState() {
    super.initState();
    initializedDatabase();
    print("Activated Database");
  }
  Future initializedDatabase() async {
    loginInfoList = await activeDatabase();
    setState(() {});
    print("Login Database activated");
  }

  Future<List<LoginModelClass>> activeDatabase()async {
    try{
      database = await openDatabase(
        path.join(await getDatabasesPath(), "LoginInfo3.db"),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
            '''
              CREATE TABLE LoginData(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                userName TEXT NOT NULL,
                password TEXT NOT NULL
              )
            '''
          );
        },
      );
    }catch(ie){
      print("Error opening database : $ie");
    }
    List<LoginModelClass> initialList = await getData();
    return initialList;
  }


  // Future<List<LoginModelClass>> activeDatabase() async{
  //   List<LoginModelClass> initialList = await getData();
  //   return initialList;
  // }

  Future<List<LoginModelClass>> getData() async{
    final localDB = await database;
    // if (localDB == null) {
    //   // Handle the case where the database is not initialized
    //   return [];
    // }

    List<Map<String,dynamic>> mapLogin = await localDB.query("LoginData");
    return List.generate(mapLogin.length, (index) {
      return LoginModelClass(
        userName: mapLogin[index]['userName'], 
        password: mapLogin[index]['password']
      );
    });
  }

  Future<void> insertData(LoginModelClass obj) async{
    final localDB = await database;

    await localDB.insert(
      "LoginData",
      obj.mapLogin(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    loginInfoList = await getData();
    setState(() {});
    print("Data inserted Successfully");
  }


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, // Prevent screen resize when keyboard appears
      body:  Form(
          key: _formkey,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/Images/photo.jpg"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // TextFormField 1
                  TextFormField(
                    controller: _userNameController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(0, 0, 0, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text("Enter username"),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      hintText: "Enter username",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter username";
                      } else {
                        return null;
                      }
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
              
                  // TextFormField 2
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.white,
                    obscureText: flag,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                        child: flag
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      fillColor: const Color.fromRGBO(0, 0, 0, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text("Enter password"),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          bool isValidated =
                              _formkey.currentState!.validate();
              
                          if (_userNameController.text.trim().isNotEmpty &&
                              _passwordController.text.trim().isNotEmpty &&
                              isValidated) {
                              loginSubmit();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                    content: Text("Login Successful"),
                                    backgroundColor: Colors.green,
                                ));
              
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const MyHomePage(),)
                              );
              
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                  content: Text("Login Failed"),
                                  backgroundColor: Colors.red,
                                ));
                          }
                            
                          _userNameController.clear();
                          _passwordController.clear();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: const BorderSide(
                          color: Color.fromARGB(255, 89, 74, 74),
                        ),
                        shape: const BeveledRectangleBorder(
                            side: BorderSide.none),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  void loginSubmit() async{
    print(loginInfoList);
    await insertData( 
      LoginModelClass( 
        userName: _userNameController.text.trim(),
        password: _passwordController.text.trim()
      )
    );
    //print(loginInfoList[]);
  }
}




// import 'package:flutter/material.dart';

// import 'homepage.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool flag = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevent screen resize when keyboard appears
//       body:  Form(
//           key: _formkey,
//           child: Container(
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("lib/assets/Images/photo.jpg"),
//                 fit: BoxFit.cover,
//                 filterQuality: FilterQuality.high,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Login",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 40,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   // TextFormField 1
//                   TextFormField(
//                     controller: _userNameController,
//                     cursorColor: Colors.white,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                     decoration: InputDecoration(
//                       errorBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                           width: 3,
//                         ),
//                       ),
//                       fillColor: const Color.fromRGBO(0, 0, 0, 1),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       label: const Text("Enter username"),
//                       labelStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                       hintText: "Enter username",
//                       hintStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "Please enter username";
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
                  
//                   const SizedBox(
//                     height: 15,
//                   ),

//                   // TextFormField 2
//                   TextFormField(
//                     controller: _passwordController,
//                     cursorColor: Colors.white,
//                     obscureText: flag,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                     decoration: InputDecoration(
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             flag = !flag;
//                           });
//                         },
//                         child: flag
//                             ? const Icon(
//                                 Icons.visibility_off,
//                                 color: Colors.white,
//                               )
//                             : const Icon(
//                                 Icons.visibility,
//                                 color: Colors.white,
//                               ),
//                       ),
//                       errorBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                           width: 3,
//                         ),
//                       ),
//                       fillColor: const Color.fromRGBO(0, 0, 0, 1),
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       label: const Text("Enter password"),
//                       labelStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                       hintText: "Password",
//                       hintStyle: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "Please enter password";
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                   const SizedBox(
//                     height: 80,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 300,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           bool isValidated =
//                               _formkey.currentState!.validate();

//                           if (_userNameController.text.trim().isNotEmpty &&
//                               _passwordController.text.trim().isNotEmpty &&
//                               isValidated) {
//                             if (_userNameController.text == "Omii007" &&
//                                 _passwordController.text == "Omkar@007" || 
//                                 _userNameController.text == "Sakshi007" && 
//                                 _passwordController.text == "Sakshi@007"  
//                               ) {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                     content: Text("Login Successful"),
//                                     backgroundColor: Colors.green,
//                                 )
//                               );

//                               Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (context) => const MyHomePage(),)
//                               );

//                             } else {
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                 content: Text("Login Failed"),
//                                 backgroundColor: Colors.red,
//                               ));
//                             }
//                           }
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         side: const BorderSide(
//                           color: Color.fromARGB(255, 89, 74, 74),
//                         ),
//                         shape: const BeveledRectangleBorder(
//                             side: BorderSide.none),
//                       ),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
      
//     );
//   }
// }
