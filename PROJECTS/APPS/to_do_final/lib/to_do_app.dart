import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ToDoApp extends StatefulWidget{
  const ToDoApp({super.key});

  @override
  State createState() => _ToDoAppState();
}

class ToDoModelClass{
  String title;
  String description;
  String date;

  ToDoModelClass(
    {required this.title, 
    required this.description, 
    required this.date}
  );
}

class _ToDoAppState extends State{

  List<ToDoModelClass> cardList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int doEdit = -1;

  bool isDataValid(){
    return titleController.text.trim().isNotEmpty && 
    descriptionController.text.trim().isNotEmpty &&
    dateController.text.trim().isNotEmpty;
  }

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
      isDismissible: true,
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
              Text(
                doEdit == -1? "Create Task" : "Edit Task",
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: titleController,
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
                    height: 12,
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
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
                    height: 12,
                  ),
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.date_range_rounded),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ) ,
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
                  ), 
                  onPressed: () {
                    if(doEdit == -1){
                      cardList.add(ToDoModelClass(
                        title: titleController.text, 
                        description: descriptionController.text, 
                        date: dateController.text));
                    }else{
                      cardList[doEdit] = ToDoModelClass(
                        title: titleController.text, 
                        description: descriptionController.text, 
                        date: dateController.text);
                    }                   
                    setState(() {
                      doEdit = -1;
                    }); 
                    Navigator.of(context).pop();   
                    titleController.clear();
                    descriptionController.clear();
                    dateController.clear();                
                  },
                  child: Text(
                    doEdit == -1? "Submit" : "Save Changes",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
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

  var listOfColors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  
  /*void editFun(index){
    showBottomSheet();
  }*/

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor:const Color.fromRGBO(2, 167, 177, 1),
        centerTitle: true,
        title:Text(
          "TODO APP",
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
          ),
        ),        
      ),

      body: ListView.builder(
        itemCount: cardList.length,
        //itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            child: Container(
              //height: 112,
              //width: 330,
              decoration: BoxDecoration(
                color: listOfColors[index % listOfColors.length],
                borderRadius: BorderRadius.circular(10),
                //color: boxColor(index),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0,0,0,0.1), offset: Offset(0,10), blurRadius: 20,spreadRadius: 1
                  )
                ],
              ),
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children:[
                  //Row1
                   Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255,255,255,1),                      
                        ),
                        child: Image.network("https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/168-512.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardList[index].title,
                              //"Take Notes",
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cardList[index].description,
                              //"Take Notes of every app you create Take notes of every app you create",
                              style: GoogleFonts.quicksand(
                                fontSize: 12, 
                                fontWeight: FontWeight.w500, 
                                //color: const Color.fromRGBO(84, 84, 84, 1), 
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child:  Row(
                      children: [
                        Text(
                          cardList[index].date,
                          //"26 Feb 2024",
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            //color: const Color.fromRGBO(132, 132, 132, 1),
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                doEdit = index;
                                titleController.text = cardList[index].title;
                                descriptionController.text = cardList[index].description;
                                dateController.text = cardList[index].date;
                                //doEdit = true;
                                //editFun(index);
                                showBottomSheet();
                                //setState(() {});
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Color.fromRGBO(0, 139, 148, 1),
                              ),
                            ),                            
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: (){
                                cardList.remove(cardList[index]);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: Color.fromRGBO(0, 139, 148, 1),
                              ),
                            ),
                          ],
                        )
                      ],
                    ), 
                  )
                ],),
              ),
            ), 
          );
        }      
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        onPressed: (){
          showBottomSheet();
        },
        child: const Icon(
          size: 50,
          Icons.add,
          color: Colors.white,
        ),
      ),   
    );
  }
}

