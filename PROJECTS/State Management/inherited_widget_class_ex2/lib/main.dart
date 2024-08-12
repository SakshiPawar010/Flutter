import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State{
  String companyName = "Google";
  int empCount = 250;
  
  @override
  Widget build(BuildContext context){       
    return Company(
      companyName: companyName,           //1

      empCount: empCount,                 //2

      child:  MaterialApp(                //3
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text( "Inherited Company State"),
            centerTitle: true,
          ),

          body: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Row( 
              //   children: [
              //     Text(Company.of(context).companyName),
              //     const SizedBox(width: 20,),
              //     Text("${Company.of(context).empCount}"),
              //   ]
              // ),

              //If this above code written here then it will give you error on red screen "Null checked operator used on null vallu "
              //Because we are trying to access data before creating object of Company 
              //means here we are inside the constructor of the company and this child is a parameter of company constructor that's why until now the object is not created and we are trying to call the of() method of company
              
              const CompanyData(),         //That's why we have to access data (method) of company class in another extra class which is CompanyData()
              const SizedBox( 
                height : 60,
              ),
              GestureDetector( 
                onTap: (){
                  setState(() {       //call the nearer build
                                      //build widget tree again(navyane widget tree build karto)
                    companyName = "NVDIA";
                    empCount++;
                  });
                },
                child: const Text( 
                  "Change Comapany",
                  style: TextStyle( 
                    backgroundColor: Colors.yellowAccent
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyData extends StatelessWidget{

  const CompanyData({super.key});

  @override
  Widget build(BuildContext context){
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Company.of(context).companyName),

        const SizedBox(width: 20,),

        Text("${Company.of(context).empCount}"),
      ]
    );
  }
}

class Company extends InheritedWidget{              //Ha class top la nhelay karan ya class kadun,  khalun varchya goshti access karata yeu shakatat
                                                    //Controller: this class has power to control things in application means what should display or what should not.
  final String companyName;
  final int empCount;

  const Company(
    {
      super.key,          //by default parameter
      required this.companyName,
      required this.empCount,
      required super.child,
    }
  );

  static Company of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Company>()!;
  }

  @override 
  bool updateShouldNotify(Company oldWidget) {        //if change is there then it returns true and framework thakes this true value and 
                                                      //framework communicate with element tree and says there is a change in widget tree so make changes in element tree 
                                                      //only after the changes in element tree UI gets updated bcoz if there any changes in element tree those changes goes for a rendering 
                                                      //and render make changes in our UI screen
                                                      //Whatever the change is happening is bcoz of updateShouldNotify method not bcoz of the setState 
                                                      //setState is only calling the build and build new widget tree
                                                      //so 
    return companyName != oldWidget.companyName || 
          empCount != empCount;
    //return empCount != empCount
  }
}