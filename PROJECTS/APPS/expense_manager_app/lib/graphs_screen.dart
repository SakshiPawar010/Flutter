import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:expense_manager_app/drawer.dart';

class GraphsScreen extends StatefulWidget {
  const GraphsScreen({super.key});
  @override
  State<GraphsScreen> createState() => _GraphsScreen();
}

class _GraphsScreen extends State<GraphsScreen> {
  Map<String, double> data = {
    "Food": 30,
    "Fule": 30,
    "Medicine": 30,
    "Entirement": 30,
    "Shopping": 30,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  leading: const Icon(Icons.menu),
        title: Text(
          "Graphs",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color.fromRGBO(33, 33, 33, 1)
          ),
        ),
      ),
      
      drawer: const MyDrawer(),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40,bottom: 30),
            child: Row(
              children: [
                Column(
                  children: [
                    PieChart(
                      dataMap: data,
                      animationDuration: const Duration(milliseconds: 2000),
                      chartType: ChartType.ring,
                      chartRadius: 200,
                      ringStrokeWidth: 30,
                      centerText: "Total",
                      chartValuesOptions:
                      const ChartValuesOptions(showChartValues: false),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration( 
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(0,0,0,0.5),
                  width: 1
                ),
                top: BorderSide(
                  color: Color.fromRGBO(0,0,0,0.5),
                  width: 1
                ),
              ),
            ),
            height: 240,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index ){
                return SizedBox(
                  height:80 ,
                  width: 284,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(214, 3, 3, 0.7)
                                  ),
                                  child: Image.asset("lib/Assets/Images/Mask group (1).png"),
                                ),
                            ),            
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text("Food",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(0,0,0, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,                      
                                ),
                              ),
                            ),                         
                            Padding(
                              padding: const EdgeInsets.only(left: 120),
                              child: Text("₹ 650.00",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(0,0,0, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          ),
          Row(  
            children: [  
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 30),
                child: Text(
                  "Total",
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(0,0,0, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,                            
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150,top: 30),
                child: Text(
                  "₹ 2,550.00",
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(0,0,0, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,                            
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}