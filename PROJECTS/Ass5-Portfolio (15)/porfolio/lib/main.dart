import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Portfolio",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int counter = -1;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: const Text("Add"),
      ),

      body:SingleChildScrollView( 
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (counter >= 0)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Name: Sakshi Dashrath Pawar",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 30
                      ),
                    ),                                                    
                  ],                
                )
              :Container(),
              (counter >= 1)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 300,
                      child:Image.network("https://lsuonline-static.s3.amazonaws.com/media/images/2021/06/15/pla-lhrd.jpeg",)
                    )
                  ],
                )
                :Container(),
              (counter >= 2)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "College: TSSMs BSCOER",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 30
                      ),
                    ),
                  ],
                )
                :Container(),
              (counter >= 3)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:250,
                      width: 300,
                      child:Image.network("https://media.licdn.com/dms/image/C560BAQGN8-2xhAYsYw/company-logo_200_200/0/1630648042478?e=2147483647&v=beta&t=TOseWzyOyYX0WLx7vhMUWmVvQAbHIb-BULGSQ3fVIi4"),
                    )
                  ],
                )
                :Container(),
              (counter >= 4)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dream Company: Google",
                      style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 30
                      ),
                    ),
                  ],
                )
                :Container(),
              (counter >= 5)
                ?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:250,
                      width: 300,
                      child:Image.network("https://blog.hubspot.com/hs-fs/hubfs/The%20Secret%20History%20of%20the%20Google%20Logo-4.jpeg?width=528&name=The%20Secret%20History%20of%20the%20Google%20Logo-4.jpeg"),                    
                    )
                  ],
                )
                :Container(),
            ],
          ),
        ),
      )
    );
  }
}
