import 'package:flutter/material.dart';

class SkillPage extends StatefulWidget{ 
  const SkillPage({super.key});

  @override 
  State createState() => _SkillPageState();
}

TextEditingController skillController = TextEditingController();

List skillsList = [];

class _SkillPageState extends State{ 
  @override 
  Widget build (BuildContext context){ 
    return Scaffold(
      appBar: AppBar( 
        title: const Text("Skills"),
        centerTitle: true,
        backgroundColor:  Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            const SizedBox( height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField( 
                controller: skillController,
                decoration: InputDecoration(
                  hintText: "Enter your Skills",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),              
              ),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: (){
                setState(() {
                  if(skillController.text.isNotEmpty){
                    skillsList.add(skillController.text);
                    skillController.clear();
                  }
                });                
              }, 
              child: const Text(
                "Add"
              ),
            ),

            const SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: skillsList.length,
                itemBuilder:(context, index) {
                  return Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Container(
                        height: 20, 
                        width: 300,
                        color: Colors.black, 
                        child: Center(
                          child: Text(
                            "${skillsList[index]}",
                            style: const TextStyle( 
                              color: Colors.white
                            ),
                          )
                        )
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}