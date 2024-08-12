import 'package:flutter/material.dart';

class Assignment4 extends StatefulWidget{
  const Assignment4({super.key});
  @override
  State createState() => _Assignment4State();
}

class _Assignment4State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,              
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  width: 5,
                  color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}