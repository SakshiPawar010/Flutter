import 'package:flutter/material.dart';

class Assignment2 extends StatelessWidget{
  const Assignment2({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 5),
                  ),
                  color: Colors.blue,
                ),
                child: const Text("Core2Web"),
              ),
            ),
          ],
        ) 
      ),
    );
  }
}