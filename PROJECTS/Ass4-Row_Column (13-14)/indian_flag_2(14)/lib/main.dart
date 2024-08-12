import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  int counter = -1;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indian Flag"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: const Text("Add"),
      ),

      body: Container(
        color: const Color.fromARGB(255, 144, 187, 222),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children:[
            (counter >= 0)
              ?Container(
                height: 500,
                width: 20,
                color: Colors.brown,
              )
              :Container(),
            Column(
              children: [
                (counter >= 1)
                  ?Container(
                    height: 80,
                    width: 250,
                    color: Colors.orange,
                  )
                  :Container(),
                (counter >=2)
                  ?Container(
                    height: 80,
                    width: 250,
                    color: Colors.white,
                    child: (counter >=3)
                      ?Image.network("https://1.bp.blogspot.com/-7EEVZKrwpxI/XFk2-ey-H2I/AAAAAAAAJgM/NL2UFgJPlBsqTr5i5EidOrVCY6KfPImfACLcBGAs/s1600/ashok+chakra.png")
                      :Container(),
                  )
                  :Container(),
                (counter >= 4)
                  ?Container(
                    height: 80,
                    width: 250,
                    color: Colors.green,
                  )
                  :Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
