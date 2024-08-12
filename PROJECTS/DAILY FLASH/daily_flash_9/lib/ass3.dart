import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Ass3 extends StatefulWidget{ 
  const Ass3({super.key});

  @override
  State<Ass3> createState() => _Ass3State();
}

class _Ass3State extends State<Ass3>{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder:(context, index) {
          return Container( 
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration( 
              border: Border.all(color: Colors.black),
            ),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container( 
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration( 
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStZhUmRGAvwdjz2afdkp2oZ7DqkHEUKfSYxAsaApAF7g&s",
                          ),
                      ),
                    ),
                  ],
                ),
                Column( 
                  children: [ 
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center( 
                        child: Text("Core2Web"),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center( 
                        child: Text("Binecaps"),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center( 
                        child: Text("Incubator"),
                      ),
                    )
                  ],
                ),
                Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration( 
                        shape:BoxShape.circle,
                        border: Border.all(color: Colors.black )
                      ),
                      child: const Icon(Icons.done)
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}