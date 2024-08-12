import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*Color boxColor(index){
  if(index == 0){
    return const Color.fromRGBO(250, 232, 232, 1);
  }else if(index == 1){
    return const Color.fromRGBO(232, 237, 250, 1);
  }else if(index == 2){
    return const Color.fromRGBO(250, 249, 232, 1);
  }else{
    index == 0;
    return const Color.fromRGBO(250, 232, 250, 1);
  }
}*/

int index = 0;

Color boxColor(index){
  if(index == 0){
    return const Color.fromRGBO(250, 232, 232, 1);
  }else if(index == 1){
    return const Color.fromRGBO(232, 237, 250, 1);
  }else if(index == 2){
    return const Color.fromRGBO(250, 249, 232, 1);
  }else {
    index = 0;
    return const Color.fromRGBO(250, 232, 250, 1);
  }/*else{
    index = 0;
    return boxColor(index);
  }*/
}

class _MyHomePageState extends State<MyHomePage>{ 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To-do list",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor:const Color.fromARGB(255, 27, 172, 170),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context,index){
          return Column(
            children: [
              const SizedBox(
                height: 23
              ),
              Container(
                height: 112,
                width: 330,
                //padding: const EdgeInsets.only(left: 15, top: 100),
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  //color: Color.fromRGBO(250, 232, 232, 1),
                  color: boxColor(index),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),offset: Offset(0, 10), blurRadius: 20,spreadRadius: 1
                    )
                  ]
                ),
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 23,
                            ),
                            Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255,255,255,1),
                                borderRadius:BorderRadius.circular(25) ,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.07),
                                    blurRadius: 10,
                                    spreadRadius: 0
                                  )
                                ],
                              ),
                              //child:,
                            ),
                            const SizedBox(
                              height: 13,
                            ),                      
                          ]                      
                        ),
                        const Column(
                          children: [
                            SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 243,
                              height: 15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start ,
                                children:[
                                  Text(
                                    "Lorem Ipsum is simply setting industry.",
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  //Icon(Icons.edit),
                                  //Icon(Icons.delete),
                                ]
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ), 
                            SizedBox(
                              width: 243,
                              height: 44,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Simply dummy text of the printing and typesetting.",
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,                                
                                    ),
                                    //overflow: TextOverflow.ellipsis,
                                    //softWrap: true,
                                  )
                                ]
                              ),
                            ) ,
                            const SizedBox(
                              height: 10,
                            ),
                          ]
                        ) 
                      ],
                    ),   
                    Row(
                      children: [
                        const SizedBox(
                        width: 5,
                        ),
                        Text(
                          "10 July 2023",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: const Color.fromRGBO(132, 132, 132, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 210,
                        ),
                        const SizedBox(
                          height: 13,
                          width: 13,
                          child:Icon(
                            Icons.edit_outlined,
                            color: Color.fromRGBO(0, 139, 148, 1),
                            size: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const SizedBox(
                          height: 13,
                          width: 10,
                          child:Icon(
                            Icons.delete_outline,
                            color: Color.fromRGBO(0, 139, 148, 1),
                            size: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ]
                ),    
              ),
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          //showBottomSheet();
        },
        child: const  Icon(Icons.add),
      )
    );
  }
}