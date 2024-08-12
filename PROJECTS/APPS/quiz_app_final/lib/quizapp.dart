import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class SingleQuestionModel{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State<QuizApp>{

  List allQuestions = [
    const SingleQuestionModel(
      question : "What is the motto of the Indian Air Force?",
      options : ["Touch the Sky with Glory","Service Before Self","Courage and Honor","Victory in the Air"],
      answerIndex : 0,
    ),
    const SingleQuestionModel(
      question : "What is the combined name for the three main branches of the Indian Armed Forces??",
      options : ["National Defense Forces","Tri-Services","Armed Services Unity","Indian Defense Alliance"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question : "Which military award is the highest honor in India and is awarded for acts of exceptional courage and bravery in times of war?",
      options : [" Param Vir Chakra","Bharat Ratna","Vir Chakra","Shaurya Chakra"],
      answerIndex : 0,
    ),
    const SingleQuestionModel(
      question : "Which special forces unit of the Indian Army is known for its expertise in counter-terrorism and unconventional warfare?",
      options : ["Garud Commando Force","National Security Guard (NSG)","Para (Special Forces)","MARCOS (Marine Commandos)"],
      answerIndex : 2,
    ),
    const SingleQuestionModel(
      question : "What is the primary role of the Indian Air Force?",
      options : [" Ground Warfare","Naval Operations","Aerial Warfare","Cybersecurity"],
      answerIndex : 2,
    ),    
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int selectedOption = -1;
  int correctAnswers = 0;

  Color? setButtonColor(int buttonIndex){
    if(selectedOption != -1){
      if(buttonIndex == allQuestions[questionIndex].answerIndex){
        return Colors.green;
      }else if(buttonIndex == selectedOption){
        return Colors.red;
      }else{
        return null;
      }
    }else{
      return null;
    }
  }

  void currentPage(){
    if(selectedOption == -1){
      return;
    }
    if(selectedOption == allQuestions[questionIndex].answerIndex){
      correctAnswers += 1;
    }
    if(selectedOption != -1){
      if(questionIndex == allQuestions.length - 1){
        setState(() {
          questionScreen = false;
        });
      }
      selectedOption = -1;
      setState(() {
        questionIndex += 1;
      });
    }
    else{             
      setState(() {
        selectedOption == -1;
        questionIndex ++ ;
      });              
    }
  }

  Scaffold isQuestionScreen() {
    if(questionScreen == true){
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        appBar: AppBar(
          title: Text(
            "QuizApp",
            style: GoogleFonts.yrsa(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.yellow,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [*/
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 110, 109, 109),
                border: Border.all(
                  color: const Color.fromARGB(255, 183, 182, 182),
                  width: 2,
                )
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   "Question : ",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      /*decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 152, 126, 49),
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.double*/
                    ),
                  ),
                  Text(
                    "${questionIndex + 1}/${allQuestions.length}",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      /*decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 152, 126, 49),
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.double*/
                    ),
                  )
                ]
              ),
            ),                        
            const SizedBox(
              height: 50,
            ),
            
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                "${questionIndex+1}. ${allQuestions[questionIndex].question}",
                style: GoogleFonts.aBeeZee(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),

              child:Container(
                width: 360,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 110, 109, 109),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  )
                ),
                child:Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Options :",
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              //decoration: TextDecoration.underline,
                              //decorationColor: Colors.white,
                            ),
                          ),
                        ),                      
                      ],
                    ),

                    Padding(padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: (){
                          if (selectedOption == -1){
                            setState(() {
                              selectedOption = 0;
                            });
                          }                
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: setButtonColor(0), 
                          minimumSize: const Size(600 , 50 ),
                          shadowColor: Colors.black,
                        ),      
                        child: Text( 
                          "A.${allQuestions[questionIndex].options[0]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: (){
                          if (selectedOption == -1){
                            setState(() {
                              selectedOption = 1;
                            });
                          }                
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: setButtonColor(1), 
                          minimumSize: const Size(600 , 50 ),
                        ),           
                        child: Text( 
                          "B.${allQuestions[questionIndex].options[1]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: (){
                            if (selectedOption == -1){
                              setState(() {
                                selectedOption = 2;
                              });
                            }                
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: setButtonColor(2), 
                          minimumSize: const Size(600 , 50 ),
                        ),            
                        child: Text( 
                          "C.${allQuestions[questionIndex].options[2]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ), 
                    ), 

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:ElevatedButton(
                        onPressed: (){
                          if (selectedOption == -1){
                            setState(() {
                              selectedOption = 3;
                            });
                          }                
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: setButtonColor(3), 
                          minimumSize: const Size(600 , 50 ),
                        ),            
                        child: Text( 
                          "D.${allQuestions[questionIndex].options[3]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),                    
                  ],
                ),
              ),
            ),           
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            currentPage();
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.yellow,
          ),
        ),
      );
    }else{
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: GoogleFonts.yrsa(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.yellow,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

        body: Center(
          child:Column(children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              //"https://www.shutterstock.com/image-vector/best-champions-cup-trophy-vector-600nw-2098544092.jpg",
              //"https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
              "https://freepngimg.com/save/153806-golden-cup-free-download-image/715x715",
              height: 400,
              width: 380,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "You have completed the quiz.",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Score : $correctAnswers/${allQuestions.length}",
              style: const TextStyle(
                color: Colors.amber
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              style:const  ButtonStyle(
                shadowColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: (){
                setState(() {
                  questionIndex = 0;
                  selectedOption = -1;
                  correctAnswers = 0;
                  questionScreen = true;
                });                
              }, 
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              )
            ),
          ],),
        ),
      );
    }
  }

  @override
  Widget build (BuildContext context){
    return isQuestionScreen();
  }
}