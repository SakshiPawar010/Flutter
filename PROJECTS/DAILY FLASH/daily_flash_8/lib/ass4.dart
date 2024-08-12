import 'package:flutter/material.dart';

class Ass4 extends StatefulWidget{ 
  const Ass4({super.key});

  State<Ass4> createState() => _Ass4State(); 
}

class _Ass4State extends State<Ass4>{ 
  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar(),

      body: ListView( 
        scrollDirection: Axis.vertical,
        semanticChildCount: 10,
        children: [ 
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/319900/319946.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("M S Dhoni"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/331100/331164.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Axar patel"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/316500/316584.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Rohit Sharma"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://bcciplayerimages.s3.ap-south-1.amazonaws.com/resizedimageskirti/9_compress.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Ravindra Jadeja"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://media.sportstiger.com/players/ViratKohli22-06-2021-06-42-06.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Virat Kohli"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/319900/319940.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Jasprit Bumrah"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/340300/340309.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Yashaswi Jaiswal"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/331100/331165.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Ishan Kishan"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/322600/322697.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Shubhman Gill"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration( 
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/331100/331164.png")
                  ),
                  const SizedBox(width: 20,),
                  const Text("Axar patel"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}