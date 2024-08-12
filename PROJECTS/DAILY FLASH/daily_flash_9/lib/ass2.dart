import 'package:flutter/material.dart';

class Ass2 extends StatefulWidget{ 
  const Ass2({super.key});

  @override
  State<Ass2> createState() => _Ass2State();
}

class _Ass2State extends State<Ass2>{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Flash"),
      ),

      body: ListView.builder( 
        itemCount: 8,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 90,
              decoration: BoxDecoration( 
                border: Border.all(color: Colors.black, width: 1)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZhUmRGAvwdjz2afdkp2oZ7DqkHEUKfSYxAsaApAF7g&s", height: 80,width: 80),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container( 
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration( 
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.black )
                      ),
                      child: const Center(child: Text("Core2Web")),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}