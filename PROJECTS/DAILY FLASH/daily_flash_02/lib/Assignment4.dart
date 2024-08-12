import 'package:flutter/material.dart';

class Assignment4 extends StatelessWidget{
  const Assignment4({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 175, 170),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(
                  width: 3,
                  color: Colors.red,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sakshi",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}