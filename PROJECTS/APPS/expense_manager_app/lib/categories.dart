//import 'package:expence_manager/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expense_manager_app/drawer.dart';


class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState();
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future<dynamic>showMyDialog() async{ 
    return await showDialog(
      context: context,
       builder: (BuildContext context){ 
        return AlertDialog( 
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title:  Text("Delete Category",
          style:GoogleFonts.poppins( 
                  fontWeight:FontWeight.w500,
                  fontSize:16,
                  color:const Color.fromRGBO(0,0,0,1)
          ),
          ),
          content:Text("Are you sure you want to delete the selected category?",
          style: GoogleFonts.poppins( 
            fontWeight:FontWeight.w400,
            fontSize:12,
            color:const Color.fromRGBO(0,0,0,1)
          ),
          ),
          actions: [ 
            ElevatedButton(
              onPressed:(){ 
                Navigator.of(context).pop();
              } ,
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(const Color.fromRGBO(14,161,125,1))), 
              child:  Text("Delete",
              style:GoogleFonts.poppins( 
                  fontWeight:FontWeight.w500,
                  fontSize:16,
                  color:const Color.fromRGBO(255, 255, 255, 1)
          ),
              ),
              ),
              const SizedBox( width: 5,),
              ElevatedButton(
              onPressed:(){ 
                Navigator.of(context).pop();
              } , 
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(const Color.fromRGBO(140, 128, 128, 0.2))),
              child:  Text("Cancel",
              style:GoogleFonts.poppins( 
                  fontWeight:FontWeight.w500,
                  fontSize:16,
                  color:const Color.fromRGBO(0,0,0,1)
          ),
              ),
              )
          ],
          
        );
    
       }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        //leading: Icon(Icons.menu),
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        actions: [
          
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.search),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: MyDrawer(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          padding: const EdgeInsets.all(8.0),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              //margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(1, 2),
                      blurRadius: 8,
                      spreadRadius: 0,
                    )
                  ]),
              // boxShadow: const [
              //           BoxShadow(
              //               color: Colors.grey,
              //               offset: Offset(10, 10),
              //               blurRadius: 20),
              //         ],
              alignment: Alignment.center,

              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async{
                      await showMyDialog();
                    },
                    child: Container(
                      height: 74,
                      width: 74,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: Image.asset(
                        "lib/Assets/Images/Mask group.png",
                        height: 74,
                        width: 74,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("${index + 1} Medicine"),
                ],
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        width: 130,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Container(
                                  height: 74,
                                  width: 74,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color.fromRGBO(191, 190, 190, 1),
                                  ),
                                  child: Image.asset("lib/Assets/Images/Group 45.png",
                                  ),
                                ),
                                //const Text("Add"),
                              ],
                            ),
                          ),
                          const Text("Image URL"),
                          const TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter URL"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Category"),
                          const TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter category name"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(67),
                                color: const Color.fromRGBO(14, 161, 125, 1),
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(67))),
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(123, 40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromRGBO(14, 161, 125, 1))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            });
          },
          backgroundColor: Colors.white,
          child: Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                  child: const Icon(Icons.add)),
              const Text("Add Category"),
            ],
          ),
        ),
      ),
     
    );
  }
}