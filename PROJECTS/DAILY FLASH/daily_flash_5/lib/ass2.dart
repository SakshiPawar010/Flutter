/* Create a Screen in which we have 3 Containers in a Column each container
must be of height 100 and width 100. Each container must have an image
as a child. */

import 'package:flutter/material.dart';

class Ass2 extends StatelessWidget{
  const Ass2({super.key});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(              
              height: 100,
              width: 100,
              decoration:const  BoxDecoration( 
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeyKaMcgJEEMeBcske1x0djyYT_LENfju7wg&usqp=CAU",
                  
                  ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 100,
              decoration:const  BoxDecoration( 
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-YmXclmxURpboA8cm9JcrB2k1s_ovxteKTl70Wfvm7fm-JCfl025RdUT-6OXudTcZDCI&usqp=CAU",
                  
                  ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 100,
              decoration:const  BoxDecoration( 
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://g3.img-dpreview.com/06EF4549F1334782AAC9B85347A79141.jpg",
                  
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}