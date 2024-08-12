import 'package:flutter/material.dart';

class Ass5 extends StatefulWidget{ 
  const Ass5({super.key});

  @override
  State<Ass5> createState() => _Ass5State();
}


class _Ass5State extends State<Ass5>{
  onSubmit(){
  
  }
  TextEditingController textEditingController = TextEditingController(); 
  TextEditingController phoneEditingController = TextEditingController();
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( ),

      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(                 
                  hintText: "Enter your name",
                  fillColor: Colors.purple,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phoneEditingController,
                decoration: InputDecoration(                 
                  hintText: "Enter Phone Number",
                  fillColor: Colors.purple,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  
                });
              }, 
              child: const Text( 
                "Submit"
              )
            ),

            const SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Column( 
                children: [ 
                  Text(textEditingController.text),
                  const SizedBox(height: 10,),
                  Text(phoneEditingController.text),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}