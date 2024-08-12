import 'package:flutter/material.dart';

class Ass1 extends StatelessWidget{
  const Ass1({super.key});
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
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding:const EdgeInsets.all(50),
                child: Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2fc56934073232.56c33cf863075.jpg"), 
              ),
            )
          ],
        ),
      )
    );
  }
  }