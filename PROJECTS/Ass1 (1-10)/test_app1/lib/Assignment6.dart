import 'package:flutter/material.dart';

class Assignment6 extends StatefulWidget{
  const Assignment6({super.key});
  @override
  State<Assignment6> createState()=> _Assignment6State();
}

class _Assignment6State extends State<Assignment6>{
  //Variable
  int? selectedIndex = 0;
  //List of Images
  final List<String> imageList=[
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1486663845017-3eedaa78617f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aHVtYW58ZW58MHx8MHx8fDA%3D",
    "https://images.unsplash.com/photo-1546019170-f1f6e46039f5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGh1bWFufGVufDB8fDB8fHww",
    "https://images.unsplash.com/photo-1544038659-12337883d216?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGh1bWFufGVufDB8fDB8fHww",
  ];
  void showNextImage(){
    setState(() {
      selectedIndex = selectedIndex! + 1;
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageList[selectedIndex!],
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: showNextImage,
             child: const Text(
              "Next",
             ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  selectedIndex = 0;
                });
              }, 
              child: const Text(
                "Reset",
              ),
            ),
          ],
        ),
      ),
    );
  }
}