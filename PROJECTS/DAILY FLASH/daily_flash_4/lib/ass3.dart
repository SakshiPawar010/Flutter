import 'package:flutter/material.dart';

class Ass3 extends StatefulWidget{
  const Ass3({super.key});

  @override
  State createState() => _Ass3State();
}

class _Ass3State extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: const Center(
        child: Text("Hii"),
      ),
            floatingActionButton: SizedBox(
              height: 50,
              width: 100,
              child: FloatingActionButton(
                onPressed: (){},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [ 
                    Icon(Icons.person_outlined),
                    Text(
                      "Sakshi",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}