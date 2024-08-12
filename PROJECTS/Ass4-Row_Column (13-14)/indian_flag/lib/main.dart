import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child:Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 550,
                    width: 10,
                    color: Colors.brown,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 450,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 100,
                    width: 450,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.network("https://media.istockphoto.com/id/1214007702/vector/the-ashoka-chakra-vector-icon-in-a-navy-blue-color-on-a-white-background-indian-national.jpg?s=612x612&w=0&k=20&c=lX4urbWR03cjZcZfgGlhS6OMkB01URFO4UsqtcyJ8D8="),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 450,
                    color: Colors.green,
                  )
                ],
              ),
            ],
            ),
          ),
        )
      ),
    );
  }
}
