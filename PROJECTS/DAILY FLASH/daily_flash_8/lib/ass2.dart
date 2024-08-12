import 'package:flutter/material.dart';

class Ass2 extends StatefulWidget{
  const Ass2({super.key});

  State<Ass2> createState() => _Ass2State();
}

class _Ass2State extends State<Ass2>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    "https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg",
                    height: 200,
                    width: 150,
                  ),
                  const Text("Burger")
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlztTa2-JZxsefK1LwknL77YWRNTDA1OIWf_7w-G_BKA_FGuLRAgcF-6lYLxwje9NAsv0&usqp=CAU",
                    height: 200,
                    width: 150,
                  ),
                  const Text("Chole Bhature")
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    "https://www.recipetineats.com/wp-content/uploads/2023/05/Garlic-cheese-pizza_9.jpg",
                    height: 200,
                    width: 150,
                  ),
                  const Text("Pizza")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}