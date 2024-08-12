import 'package:flutter/material.dart';

class Assignment3 extends StatelessWidget{
  const Assignment3({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 186, 127, 197),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                  color: Colors.purple,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}