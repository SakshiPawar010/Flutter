import 'package:flutter/material.dart';

class Assignment7 extends StatelessWidget{
  const Assignment7({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [ 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD0SG0P-maEL18USKddIL616I4IWbHEETyw6T5ywl1bA&s",
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?cs=srgb&dl=pexels-james-wheeler-414612.jpg&fm=jpg",
                  width: 300,
                  height: 150,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pink,
                child: Image.network(
                  "https://t4.ftcdn.net/jpg/02/87/42/67/360_F_287426729_qbmatCI3Tc8XIQ5hjUJriYZOZlVUOnb4.jpg",
                  width: 300,
                  height: 150,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}