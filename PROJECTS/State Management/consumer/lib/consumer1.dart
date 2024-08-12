import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'dart:developer';

void main(){
   runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    log("In MyApp Build");
    return MultiProvider(
      providers: [ 
        Provider(
          create:(context) {
            return Player(playerName:"Dhoni", jerNo:7);
          },        
        ),
        ChangeNotifierProvider(
          create:(context) {
            return Match(matchNo: 200,runs: 7000);
          }, 
        )
      ] ,
      child: const MaterialApp(
        home: MatchSummary(),
      ),   
    );
  }
}

class MatchSummary extends StatefulWidget{
  const MatchSummary({super.key});

  @override 
  State createState() => _MatchSummaryState();
}

class _MatchSummaryState extends State{
  @override 
  Widget build(BuildContext context) {
    log("In MatchSummary Build");
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.blue,
        title: const Text("Consumer Demo"),
        centerTitle: true, 
      ),
      body: Column(                                           //Consumer use kela tar
        children: [ 
          Text(Provider.of<Player>(context).playerName),      //immutable data so call janar nahi
          const SizedBox(height: 50,),
          Text("${Provider.of<Player>(context).jerNo}"),       //call janar nahi
          const SizedBox(height: 50,),
          Text("${Provider.of<Match>(context).matchNo}"),     //Fakt jith garaj aahe tithech call janar
          const SizedBox(height: 50,),
          Text("${Provider.of<Match>(context).runs}"),        //call  janar
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: (){
              Provider.of<Match>(context, listen: false).changeData(202,7100);
            }, 
            child: const Text("Change Data")
          ),
          const SizedBox(height: 50,),
          const NormalClass(),            
        ],
      ),
    ) ; 
  }
}
class NormalClass extends StatelessWidget{
  const NormalClass({super.key});

  @override 
  Widget build(BuildContext context) {
    log("In NormalClass Build");
    return Text("${Provider.of<Match>(context).matchNo}");    //Change honara data aahe tymule call jato
    //return Text(Provider.of<Player>(context).playerName);  //Immutable Provider tymule parat call jaat nahi
  }
}

class Player {
  String playerName;
  int jerNo;
  Player({required this.playerName,required this.jerNo});
}

class Match with ChangeNotifier{
  int matchNo;
  int runs;

  Match({required this.matchNo, required this.runs});

  void changeData(int matchNo, int runs){
    this.matchNo = matchNo;
    this.runs = runs;
    notifyListeners();
  }
}