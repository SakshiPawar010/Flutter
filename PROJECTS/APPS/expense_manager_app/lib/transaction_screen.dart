import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
//import 'package:expense_manager_app/categories.dart';
import 'package:expense_manager_app/drawer.dart';
//import 'package:expense_manager_app/graphs_screen.dart';
//import 'package:expense_manager_app/trash_screen.dart';


// class TransactionScreen extends StatefulWidget{
//   const TransactionScreen({super.key});
//   @override 
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }
// TextEditingController dateController = TextEditingController();
// TextEditingController amountController = TextEditingController();
// TextEditingController categoryController = TextEditingController();
// TextEditingController descriptionController = TextEditingController();
// class _TransactionScreenState extends State<TransactionScreen>{ 
//   void showBottomSheet(){
//     showModalBottomSheet(
//       isScrollControlled: true,
//       scrollControlDisabledMaxHeightRatio: 800,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.0),
//           topRight: Radius.circular(30.0),
//         ),
//       ),
//       // isDismissible: true,
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 20,
//             right: 20,
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "Date",
//                     style: GoogleFonts.poppins(
//                       color: const Color.fromRGBO(33, 33, 33, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 13,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   TextField(
//                     controller: dateController,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       //suffixIcon: const Icon(Icons.date_range_rounded),
//                       // focusedBorder: OutlineInputBorder(
//                       //   borderRadius: BorderRadius.circular(1),
//                       //   borderSide: const BorderSide(
//                       //     color: Color.fromRGBO(191, 189, 189, 1),
//                       //   ),
//                       // ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Color.fromRGBO(191, 189, 189, 1),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     onTap: () async{
//                       DateTime? pickeddate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2024),
//                         lastDate: DateTime(2025),
//                       );
//                       String formatedDate = DateFormat.yMMMd().format(pickeddate!);
//                       setState(() {
//                         dateController.text = formatedDate;
//                       });
//                     },
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   Text(
//                     "Amount",
//                     style: GoogleFonts.quicksand(
//                       color: const Color.fromRGBO(33, 33, 33, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   TextField(
//                     controller: amountController,
//                     decoration: InputDecoration(
//                       // focusedBorder: OutlineInputBorder(
//                       //   borderRadius: BorderRadius.circular(12),
//                       //   borderSide: const BorderSide(
//                       //     color: Color.fromRGBO(0, 139, 148, 1),
//                       //   ),
//                       // ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color:Color.fromRGBO(191, 189, 189, 1) ,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 12,
//                   ),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Navigator.push(context, 
//                   // MaterialPageRoute(builder:(context)=>CategoriesScreen()));
//                   //   },
//                     //child: Container(
//                       //child:
//                        Text(
//                         "Category",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromRGBO(33, 33, 33, 1),
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                         //),
//                       //),
//                     ),
//                   ),
//                   TextField(
//                     controller: categoryController,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(
//                           color: Color.fromRGBO(0, 139, 148, 1),
//                         ),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color: Colors.purpleAccent,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),                  
//                   const SizedBox(
//                     height: 3,
//                   ), 
//                   Text(
//                     "Description",
//                     style: GoogleFonts.quicksand(
//                       color: const Color.fromRGBO(33, 33, 33, 1),
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   TextField(
//                     controller: descriptionController,
//                     decoration: InputDecoration(
//                       // focusedBorder: OutlineInputBorder(
//                       //   borderRadius: BorderRadius.circular(12),
//                       //   borderSide: const BorderSide(
//                       //     color: Color.fromRGBO(0, 139, 148, 1),
//                       //   ),
//                       // ),
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(
//                           color:Color.fromRGBO(191, 189, 189, 1) ,
//                         ),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),                                   
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ) ,
//               Container(
//                 height: 40,
//                 width: 123,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: const [ 
//                     BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 4)
//                   ]
//                 ),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(67),
//                     ),
//                     backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
//                   ), 
//                   onPressed: () {},
//                   child: Text(
//                     "Add",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context){ 
//     return Scaffold(
//       appBar: AppBar( 
//         title: Text("June 2022",
//           style: GoogleFonts.poppins( 
//             fontWeight: FontWeight.w500,
//             fontSize: 16 ,
//             color: const Color.fromRGBO(33, 33, 33, 1),
//           ),
//         ),
//         actions: const  [Icon(Icons.search)],
//         //leading: const Icon(Icons.menu),
//       ),
//      drawer:const MyDrawer(),
//       body: 
//           ListView.builder(
//             // shrinkWrap: true,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Container(
//                 height: 61,
//                 width: 300,
//                 child: Column(
//                   children: [
//                     Row( 
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [ 
//                         Padding(
//                           padding: const EdgeInsets.only(left:12 , right:12 ),
//                           child: Image.asset("lib/asstes/images/Group 67.png", height: 41, width: 41,),
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Medicine",
//                               style: GoogleFonts.poppins( 
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15,
//                                 color: Colors.black
//                               ),                                  
//                             ),
//                             // const Spacer(),
//                             Text("Lorem Ipsum is simply dummy text of the ",
//                               style: GoogleFonts.poppins( 
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 10,
//                                 color: const Color.fromRGBO(0, 0, 0, 0.8)
//                               ),
//                             ),                            
//                           ],
//                         ),
//                         const Spacer(), 
//                         Row(
//                           //mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             //Spacer(),
//                             const Icon(Icons.remove_circle, color: Colors.red, size: 15,),
//                             const SizedBox(width: 10,),
//                             Text(
//                               "500",
//                               style: GoogleFonts.poppins( 
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 15,
//                                 color: Colors.black
//                               ),  
//                             ), 
//                             const SizedBox(width: 10,)  
//                           ],
//                         ),                                                  
//                       ],
//                     ),
//                     Row( 
//                       children: [ 
//                       const Spacer(),
//                       Text(
//                         "3 June | 11:50 AM",
//                         style: GoogleFonts.poppins( 
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 10,
//                                 color: const Color.fromRGBO(0, 0, 0, 0.6)
//                               ),    
//                       ),
//                       const SizedBox(width: 10,)
//                       ],
//                     )
//                   ],               
//                 ),            
//               );
//             },
//           ) ,
//           floatingActionButton: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   height: 46,
//                   width: 166,
//                   decoration: BoxDecoration( 
//                     borderRadius: BorderRadius.circular(67) ,
//                     boxShadow: const  [ 
//                       BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 4,)
//                     ]
//                   ),
//                   child: FloatingActionButton(
//                     backgroundColor: Colors.white,
//                     onPressed: (){
//                       showBottomSheet();
//                     },
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add_circle_rounded, color: Colors.green,),
//                         Text( "Add Transition"),
//                       ],
//                     )
//                   ),
//                 ),
//               ],
//             ),
//           ),    
//     );    
//   }
// }




class TransactionScreen extends StatefulWidget{
  const TransactionScreen({super.key});

  @override 
  State<TransactionScreen> createState() => _TransactionScreenState();
}

TextEditingController dateController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _TransactionScreenState extends State<TransactionScreen>{ 

  void showBottomSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      scrollControlDisabledMaxHeightRatio: 800,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      // isDismissible: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      //suffixIcon: const Icon(Icons.date_range_rounded),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(1),
                      //   borderSide: const BorderSide(
                      //     color: Color.fromRGBO(191, 189, 189, 1),
                      //   ),
                      // ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(191, 189, 189, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async{
                      DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );
                      String formatedDate = DateFormat.yMMMd().format(pickeddate!);
                      setState(() {
                        dateController.text = formatedDate;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Amount",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12),
                      //   borderSide: const BorderSide(
                      //     color: Color.fromRGBO(0, 139, 148, 1),
                      //   ),
                      // ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color:Color.fromRGBO(191, 189, 189, 1) ,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  TextField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 139, 148, 1),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.purpleAccent,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),                  
                  const SizedBox(
                    height: 3,
                  ), 
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12),
                      //   borderSide: const BorderSide(
                      //     color: Color.fromRGBO(0, 139, 148, 1),
                      //   ),
                      // ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color:Color.fromRGBO(191, 189, 189, 1) ,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                                   
                ],
              ),
              const SizedBox(
                height: 20,
              ) ,
              Container(
                height: 40,
                width: 123,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [ 
                    BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 4)
                  ]
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67),
                    ),
                    backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                  ), 
                  onPressed: () {},
                  child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      appBar: AppBar( 
        title: Text("June 2022",
          style: GoogleFonts.poppins( 
            fontWeight: FontWeight.w500,
            fontSize: 16 ,
            color: const Color.fromRGBO(33, 33, 33, 1),
          ),
        ),
        actions: const  [Icon(Icons.search)],
        //leading: const Icon(Icons.menu),
      ),
      drawer:const MyDrawer(),

      body: 
          ListView.builder(
            // shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 61,
                width: 300,
                child: Column(
                  children: [
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [ 
                        Padding(
                          padding: const EdgeInsets.only(left:12 , right:12 ),
                          child: Image.asset("lib/Assets/Images/Mask group.png", height: 41, width: 41,),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Medicine",
                              style: GoogleFonts.poppins( 
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black
                              ),                                  
                            ),
                            // const Spacer(),
                            Text("Lorem Ipsum is simply dummy text of the ",
                              style: GoogleFonts.poppins( 
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color.fromRGBO(0, 0, 0, 0.8)
                              ),
                            ),                            
                          ],
                        ),
                        const Spacer(), 
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //Spacer(),
                            const Icon(Icons.remove_circle, color: Colors.red, size: 15,),
                            const SizedBox(width: 10,),
                            Text(
                              "500",
                              style: GoogleFonts.poppins( 
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black
                              ),  
                            ), 
                            const SizedBox(width: 10,)  
                          ],
                        ),                                                  
                      ],
                    ),
                    Row( 
                      children: [ 
                      const Spacer(),
                      Text(
                        "3 June | 11:50 AM",
                        style: GoogleFonts.poppins( 
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color.fromRGBO(0, 0, 0, 0.6)
                              ),    
                      ),
                      const SizedBox(width: 10,)
                      ],
                    )
                  ],               
                ),             
              );
            },
          ) ,

          floatingActionButton: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 46,
                  width: 166,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(67) ,
                    boxShadow: const  [ 
                      BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.25), blurRadius: 4,)
                    ]
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: (){
                      showBottomSheet();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_rounded, color: Colors.green,),
                        Text( "Add Transition"),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),  
    );    
  }
}