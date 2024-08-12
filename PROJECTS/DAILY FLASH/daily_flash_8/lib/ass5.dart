import 'package:flutter/material.dart';

class Ass5 extends StatefulWidget{ 
  const Ass5({super.key});

  State<Ass5> createState() => _Ass5State();
}

class _Ass5State extends State<Ass5>{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text("Daily Flash"),
      ),
      body: ListView.builder( 
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container( 
              width: double.infinity,
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.black, width: 1)
              ),
              child: const Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text("Title 1"),
                        
                        Text("Give some description here")
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.add_circle_outline_rounded, color: Colors.purple,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}