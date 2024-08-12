import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:cricket_app/batsmanProfile.dart';

//import 'package:database_provider.dart';
//import 'package:image_picker/image_picker.dart';

class Batsman extends StatefulWidget{
  //final Function(int) onItemTapped;
  const Batsman({super.key});

  @override 
  State<Batsman> createState() => _BatsmanState();
}

class BatsmanModelClass{
  int? id;
  String country;
  String born;
  String birthPlace;
  String nickName;
  String role;
  String battingStyle;
  String bowlingStyle;
  String playerName;
  String playerImage;

  BatsmanModelClass(
    {
      this.id,
      required this.country,
      required this.born,
      required this.birthPlace,
      required this.nickName,
      required this.role,
      required this.battingStyle,
      required this.bowlingStyle,
      required this.playerName,
      required this.playerImage,
    }
  );

  Map<String, dynamic> mapPlayer (){
    return {
      'id':id,
      'country': country,
      'born': born,
      'birthPlace': birthPlace,
      'nickName': nickName,
      'role': role,
      'battingStyle': battingStyle,
      'bowlingStyle':bowlingStyle,
      'playerName': playerName,
      'playerImage': playerImage,
    };
  }

  @override
  String toString(){
    return '''{
      id: $id, 
      country: $country, 
      born: $born, 
      birthPlace: $birthPlace,
      nickName: $nickName,
      role: $role,
      battingStyle: $battingStyle,
      bowlingStyle: $bowlingStyle,
      playerName: $playerName,
      playerImage: $playerImage
    }''';
  }
}

dynamic database;
List batsmanInfoList = [];
class _BatsmanState extends State<Batsman>{

  // void _navigateToBatsmanProfilePage(){
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(builder: (context) => const BatsmanProfile())
  //   );
  // }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async {
    await initializedDatabase();

    });
    print("Activated Database");
  }

  // batsmanInfoList INITIALIZE BEFORE CALL FOR ACTIVEBASE
  // IN ACTIVEDATABASE DATABASE CREATE
  Future initializedDatabase()async{
    batsmanInfoList = await activeDatabase(); // DATA COPY
    setState(() {});
  }

  // DATABASE CREATE AND ACTIVATED
  Future<List<BatsmanModelClass>> activeDatabase()async {
    try{
      database = await openDatabase(
        path.join(await getDatabasesPath(), "CricketerInfo4.db"),
        version: 1,
        onCreate: (db, version) async {
          // await db.execute(
          //   '''
          //     CREATE TABLE LoginData1(
          //       id INTEGER PRIMARY KEY AUTOINCREMENT
          //       userName TEXT NOT NULL,
          //       password TEXT NOT NULL
          //     )
          //   '''
          // );
          await db.execute(
            '''
              CREATE TABLE BatsmanData(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                country TEXT NOT NULL,
                born TEXT NOT NULL,
                birthPlace TEXT NOT NULL,
                nickName TEXT NOT NULL,
                role TEXT NOT NULL,
                battingStyle TEXT NOT NULL,
                bowlingStyle TEXT NOT NULL,
                playerName TEXT NOT NULL , 
                playerImage TEXT NOT NULL              
              )
            '''
          );
          await db.execute(
            '''
              CREATE TABLE BowlerData(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                country TEXT NOT NULL,
                born TEXT NOT NULL,
                birthPlace TEXT NOT NULL,
                nickName TEXT NOT NULL,
                role TEXT NOT NULL,
                battingStyle TEXT NOT NULL,
                bowlingStyle TEXT NOT NULL,
                playerName TEXT NOT NULL,
                playerImage TEXT NOT NULL                
              )
            '''
          );
          await db.execute(
            '''
              CREATE TABLE AllRounderData(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                country TEXT NOT NULL,
                born TEXT NOT NULL,
                birthPlace TEXT NOT NULL,
                nickName TEXT NOT NULL,
                role TEXT NOT NULL,
                battingStyle TEXT NOT NULL,
                bowlingStyle TEXT NOT NULL,
                playerName TEXT NOT NULL,
                playerImage TEXT NOT NULL                    
              )
            '''
          );
        },
      );
    }catch(ie){
      print("Error opening database : $ie");
    }
    List<BatsmanModelClass> initialList = await getData();
    return initialList;
  }

  // DATA INSERT INTO DATABASE
  Future<void> insertData(BatsmanModelClass obj)async {
    final localDB = await database;

    await localDB.insert(
      "BatsmanData",
      obj.mapPlayer(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    batsmanInfoList = await getData();
    setState(() {});
    print("Data inserted successfully");
  }

  // FETCH OR RETRIVE DATA IN DATABASE
  Future<List<BatsmanModelClass>> getData()async {
    final localDB = await database;
    print("Data Fetched Successfully");
    List <Map<String,dynamic>> mapList = await localDB.query("BatsmanData");
    return List.generate(mapList.length, (index) {
      return BatsmanModelClass(
        id: mapList[index]['id'],
        country: mapList[index]['country'], 
        born: mapList[index]['born'], 
        birthPlace: mapList[index]['birthPlace'], 
        nickName: mapList[index]['nickName'], 
        role: mapList[index]['role'], 
        battingStyle: mapList[index]['battingStyle'], 
        bowlingStyle: mapList[index]['bowlingStyle'], 
        playerName: mapList[index]['playerName'], 
        playerImage: mapList[index]['playerImage'],
      );
    });
  }

  // DELETE DATA IN DATABASE
  Future<void> deleteDataBaseCard(BatsmanModelClass obj)async {
    final localDB = await database;

    await localDB.delete(
      "BatsmanData",
      where: "id = ?",
      whereArgs: [obj.id],
    );
    batsmanInfoList = await getData();
    setState(() {});
    print("Delete data successfully");
  }

  // UPDATE DATA IN DATABASE

  Future<void> updateDataBase(BatsmanModelClass obj)async {
    final localDB = await database;

    await localDB.update(
      "BatsmanData",
      obj.mapPlayer(),
      where: "id = ?",
      whereArgs: [obj.id],
    );
    batsmanInfoList = await getData();
    setState(() {});
    print("update data successfully");
  }

  // void submit([BatsmanModelClass? batsmanModelClassObj]){
  //   if(_playerNameController.text.trim().isNotEmpty &&
  //     _countryController.text.trim().isNotEmpty){
  //       setState(() {
  //         batsmanModelClassObj!.playerName = _playerNameController.text;
  //         batsmanModelClassObj.country = _countryController.text;
  //         //batsmanModelClassObj.playerImage = _image;
  //       });
  //   }else{

  //   }
  // }

  // File? _image ;
  // final picker = ImagePicker();

  // Future getImage()async{
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //    print(pickedFile)
  //   setState(() {
  //     if(pickedFile != null){
  //       _image = File(pickedFile.path);
  //     }else{
  //       print("No File Selected");
  //     }
  //   });
  // }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _bornController = TextEditingController();
  final TextEditingController _birthplaceController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _battingstyleController = TextEditingController();
  final TextEditingController _bowlingstyleController = TextEditingController();
  final TextEditingController _playerimageController = TextEditingController();



  void showBottomSheet(bool flag,[BatsmanModelClass? editIndex]){
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      isDismissible: true,
      context: context, 
      builder: (context){ 
        return SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ), 
              child: Column( 
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  // Image.asset(name)
                  // Image.file(File(pickedFile.path))
                  //const SizedBox(height: 40,),
                  Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
            
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Enter Batsman Info",
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                        ),
                      ),

                      // 1 PLAYER IMAGE SELECT IN DEVICE
                      Text(
                        "IMAGE:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _playerimageController,
                        decoration: InputDecoration( 
                          hintText: "Enter Player Image URL ",
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter image url";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 2 PLAYER NAME STORE
                      Text(
                        "NAME:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _playerNameController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter name";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),                  
            
                      // 3 PLAYER COUNTRY
                      Text(
                        "COUNTRY:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _countryController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter country";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 3 PLAYER BIRTHDATE(BORN)
                      Text(
                        "BORN:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _bornController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter born date";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 4 PLAYER BIRTHPLACE
                      Text(
                        "BIRTHPLACE:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _birthplaceController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter birthplace";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 5 PLAYER NICKNAME
                      Text(
                        "NICKNAME:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _nicknameController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter nickname";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 6 PLAYER ROLE
                      Text(
                        "ROLE:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _roleController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter role";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 7 PLAYER BATTING STYLE
                      Text(
                        "BATTING STYLE:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _battingstyleController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter batting style";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      // 8 PLAYER BOWLING STYLE
                      Text(
                        "BOWLING STYLE:",
                        style: GoogleFonts.quicksand(
                          color: const Color.fromARGB(255, 5, 82, 146),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TextFormField( 
                        controller: _bowlingstyleController,
                        decoration: InputDecoration( 
                          focusedBorder: OutlineInputBorder( 
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide( 
                              color: Colors.blue,
                            ),
                          ),
                          border: OutlineInputBorder( 
                            borderSide: const BorderSide( 
                              color: Colors.black
                            ),
                            borderRadius: BorderRadius.circular(12), 
                          )
                        ),
                        validator: (value) {
                          if(value == null || value.trim().isEmpty){
                            return "please enter bowling style";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10,),
            
                      
                      const SizedBox(height: 10,),
            
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed:(){
                              flag? onSubmit(flag,editIndex): onSubmit(flag);
                              //submit();
                              Navigator.of(context).pop();
                            } , 
                            style: const ButtonStyle( 
                              backgroundColor: MaterialStatePropertyAll(Colors.blue),
                              //iconColor: MaterialStatePropertyAll(Colors.blue),
                              shadowColor: MaterialStatePropertyAll(Colors.black)
                            ),
                            child: Text(
                              "Submit",
                              style: GoogleFonts.quicksand( 
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ) 
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ), 
            ),
          ),
        );
      }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar( 
        actions: const [ 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.search_outlined, color: Colors.white, size: 30,),
          )
        ],
        title: Text(
          "Batsman",
          style: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize:25,
          ),
        ),
        centerTitle: true,
        //backgroundColor: const Color.fromRGBO(1,87, 155, 1),
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(
        itemCount: batsmanInfoList.length,
        itemBuilder: (context, index){
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.2,
              motion: const DrawerMotion(),
              dragDismissible: false,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ 
                      GestureDetector(
                        onTap: () {
                          // INDEX PASS FOR EDIT DATA IN LIST
                          editTask(batsmanInfoList[index]);
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromRGBO(0,0,0,0.1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
                            //size: 20,
                          ),
                        ),
                      ),
                  
                      GestureDetector(
                        onTap: () {
                          // INDEX PASS TO DATABASE WHICH OBJECT DELETE IN DATABASE
                          removeTask(batsmanInfoList[index]);
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromRGBO(0,0,0,0.1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.black,
                            //size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ], 
            ),
            child: GestureDetector(
              onTap: (){
                final passIndex = batsmanInfoList[index];
                print(passIndex);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BatsmanAllInfo(batsmanInfo: passIndex,),)
                );
              },
              child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    //height: 100,
                    decoration: const  BoxDecoration( 
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [ 
                        BoxShadow(offset: Offset(5, 5), 
                          color: Color.fromARGB(255, 162, 207, 244)
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        // Container(
                        //   height: 80,
                        //   width: 80,
                        //   decoration: const BoxDecoration( 
                        //     shape: BoxShape.circle,
                        //     color: Colors.white
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(5),
                        //     child: _image == null
                        //       ? const Align(
                        //           alignment: Alignment.center,
                        //           child:  Text("No Image"),
                        //         )
                        //       : Image.file(batsmanInfoList[index].playerImage),
                        //   ),
                        // ),
                        
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration( 
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(batsmanInfoList[index].playerImage),
                              fit: BoxFit.fitHeight,
                              filterQuality: FilterQuality.high
                            )
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              batsmanInfoList[index].playerName,
                              style: GoogleFonts.quicksand( 
                                fontSize:20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text( 
                              batsmanInfoList[index].country,
                              style: GoogleFonts.quicksand( 
                                fontSize:20,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0,0,0,0.7),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _countryController.clear();
          _bornController.clear();
          _birthplaceController.clear();
          _nicknameController.clear();
          _roleController.clear();
          _battingstyleController.clear();
          _bowlingstyleController.clear();
          _playerNameController.clear();
          _playerimageController.clear();
          showBottomSheet(false);
        },
        child: const Icon(Icons.add, size: 30 ,), 
      ),
    );
  }

  void editTask(BatsmanModelClass batsmanModelObj){
    // ASSIGN THE TEXT EDITING CONTROLLERS WITH THE TEXT VALUES AND THEN OPEN THE BOTTOMSHEET

    _countryController.text = batsmanModelObj.country;
    _bornController.text = batsmanModelObj.born;
    _birthplaceController.text = batsmanModelObj.birthPlace;
    _nicknameController.text = batsmanModelObj.nickName;
    _roleController.text = batsmanModelObj.role;
    _battingstyleController.text = batsmanModelObj.battingStyle;
    _bowlingstyleController.text = batsmanModelObj.bowlingStyle;
    _playerNameController.text = batsmanModelObj.playerName;

    print(batsmanModelObj);
    showBottomSheet(true,batsmanModelObj);
  }

  // REMOVE TASK
  Future<void> removeTask(BatsmanModelClass obj)async {

    await deleteDataBaseCard(obj);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data delete successfully"),
        backgroundColor: Color.fromARGB(255,76,149,175),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _countryController.dispose();
    _bornController.dispose();
    _birthplaceController.dispose();
    _nicknameController.dispose();
    _roleController.dispose();
    _battingstyleController.dispose();
    _bowlingstyleController.dispose();
    _playerNameController.dispose();
    _playerimageController.dispose();
  }

  void onSubmit(bool flag,[BatsmanModelClass? editIndex])async {
    bool enterData = _formkey.currentState!.validate();

    if(
      _countryController.text.trim().isNotEmpty &&
      _bornController.text.trim().isNotEmpty &&
      _birthplaceController.text.trim().isNotEmpty &&
      _nicknameController.text.trim().isNotEmpty &&
      _roleController.text.trim().isNotEmpty && 
      _battingstyleController.text.trim().isNotEmpty && 
      _bowlingstyleController.text.trim().isNotEmpty && 
      _playerNameController.text.trim().isNotEmpty &&
      _playerimageController.text.trim().isNotEmpty &&
      enterData
    ){
      if(!flag){
        await insertData(
            BatsmanModelClass(
              country: _countryController.text.trim(), 
              born: _bornController.text.trim(), 
              birthPlace: _birthplaceController.text.trim(), 
              nickName: _nicknameController.text.trim(), 
              role: _roleController.text.trim(), 
              battingStyle: _battingstyleController.text.trim(), 
              bowlingStyle: _bowlingstyleController.text.trim(), 
              playerName: _playerNameController.text.trim(), 
              playerImage: _playerimageController.text.trim(),
            ),
          );
        setState(() async{
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Data add successfully"),
              backgroundColor: Colors.green,
            ),
          );
        });
      }else{
        await updateDataBase(
            BatsmanModelClass(
              id: editIndex!.id,
              country: _countryController.text.trim(), 
              born: _bornController.text.trim(), 
              birthPlace: _birthplaceController.text.trim(), 
              nickName: _nicknameController.text.trim(), 
              role: _roleController.text.trim(), 
              battingStyle: _battingstyleController.text.trim(), 
              bowlingStyle: _bowlingstyleController.text.trim(), 
              playerName: _playerNameController.text.trim(), 
              playerImage: _playerimageController.text.trim(),
            ),
          );
        setState(() async{
          print("In updateddatabase");
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Data updated successfully"),
              backgroundColor: Colors.green,
            ),
          );
        });
      }
    }
    clearController();
  }

  // CLEAR ALL TEXT EDITING CONTROLLER
    void clearController(){
      _countryController.clear();
      _bornController.clear();
      _birthplaceController.clear();
      _nicknameController.clear();
      _roleController.clear();
      _battingstyleController.clear();
      _bowlingstyleController.clear();
      _playerNameController.clear();
      _playerimageController.clear();
    }
  
}



// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as path;

// //import 'package:database_provider.dart';
// //import 'package:image_picker/image_picker.dart';

// class Batsman extends StatefulWidget{
//   const Batsman({super.key});

//   @override 
//   State createState() => _BatsmanState();
// }

// class BatsmanModelClass{
//   int? id;
//   String country;
//   String born;
//   String birthPlace;
//   String nickName;
//   String role;
//   String battingStyle;
//   String bowlingStyle;
//   String playerName;
//   String playerImage;

//   BatsmanModelClass(
//     {
//       this.id,
//       required this.country,
//       required this.born,
//       required this.birthPlace,
//       required this.nickName,
//       required this.role,
//       required this.battingStyle,
//       required this.bowlingStyle,
//       required this.playerName,
//       required this.playerImage,
//     }
//   );

//   Map<String, dynamic> mapPlayer (){
//     return {
//       'id':id,
//       'country': country,
//       'born': born,
//       'birthPlace': birthPlace,
//       'nickName': nickName,
//       'role': role,
//       'battingStyle': battingStyle,
//       'bowlingStyle':bowlingStyle,
//       'playerName': playerName,
//       'playerImage': playerImage,
//     };
//   }

//   @override
//   String toString(){
//     return '''{
//       id: $id, 
//       country: $country, 
//       born: $born, 
//       birthPlace: $birthPlace,
//       nickName: $nickName,
//       role: $role,
//       battingStyle: $battingStyle,
//       bowlingStyle: $bowlingStyle,
//       playerName: $playerName,
//       playerImage: $playerImage
//     }''';
//   }
// }

// dynamic database;
// List batsmanInfoList = [];
// class _BatsmanState extends State{

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero,()async {
//     await initializedDatabase();

//     });
//     print("Activated Database");
//   }

//   // batsmanInfoList INITIALIZE BEFORE CALL FOR ACTIVEBASE
//   // IN ACTIVEDATABASE DATABASE CREATE
//   Future initializedDatabase()async{
//     batsmanInfoList = await activeDatabase(); // DATA COPY
//     setState(() {});
//   }

//   // DATABASE CREATE AND ACTIVATED
//   Future<List<BatsmanModelClass>> activeDatabase()async {
//     try{
//       database = await openDatabase(
//         path.join(await getDatabasesPath(), "CricketerInfo2.db"),
//         version: 1,
//         onCreate: (db, version) async {
//           await db.execute(
//             '''
//               CREATE TABLE BatsmanData(
//                 id INTEGER PRIMARY KEY AUTOINCREMENT,
//                 country TEXT NOT NULL,
//                 born TEXT NOT NULL,
//                 birthPlace TEXT NOT NULL,
//                 nickName TEXT NOT NULL,
//                 role TEXT NOT NULL,
//                 battingStyle TEXT NOT NULL,
//                 bowlingStyle TEXT NOT NULL,
//                 playerName TEXT NOT NULL , 
//                 playerImage TEXT NOT NULL              
//               )
//             '''
//           );
//           await db.execute(
//             '''
//               CREATE TABLE BowlerData(
//                 id INTEGER PRIMARY KEY AUTOINCREMENT,
//                 country TEXT NOT NULL,
//                 born TEXT NOT NULL,
//                 birthPlace TEXT NOT NULL,
//                 nickName TEXT NOT NULL,
//                 role TEXT NOT NULL,
//                 battingStyle TEXT NOT NULL,
//                 bowlingStyle TEXT NOT NULL,
//                 playerName TEXT NOT NULL,
//                 playerImage TEXT NOT NULL                
//               )
//             '''
//           );
//           await db.execute(
//             '''
//               CREATE TABLE AllRounderData(
//                 id INTEGER PRIMARY KEY AUTOINCREMENT,
//                 country TEXT NOT NULL,
//                 born TEXT NOT NULL,
//                 birthPlace TEXT NOT NULL,
//                 nickName TEXT NOT NULL,
//                 role TEXT NOT NULL,
//                 battingStyle TEXT NOT NULL,
//                 bowlingStyle TEXT NOT NULL,
//                 playerName TEXT NOT NULL,
//                 playerImage TEXT NOT NULL                    
//               )
//             '''
//           );
//         },
//       );
//     }catch(ie){
//       print("Error opening database : $ie");
//     }
//     List<BatsmanModelClass> initialList = await getData();
//     return initialList;
//   }

//   // DATA INSERT INTO DATABASE
//   Future<void> insertData(BatsmanModelClass obj)async {
//     final localDB = await database;

//     await localDB.insert(
//       "BatsmanData",
//       obj.mapPlayer(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     batsmanInfoList = await getData();
//     setState(() {});
//     print("Data inserted successfully");
//   }

//   // FETCH OR RETRIVE DATA IN DATABASE
//   Future<List<BatsmanModelClass>> getData()async {
//     final localDB = await database;

//     List <Map<String,dynamic>> mapList = await localDB.query("BatsmanData");
//     return List.generate(mapList.length, (index) {
//       return BatsmanModelClass(
//         id: mapList[index]['id'],
//         country: mapList[index]['country'], 
//         born: mapList[index]['born'], 
//         birthPlace: mapList[index]['birthPlace'], 
//         nickName: mapList[index]['nickName'], 
//         role: mapList[index]['role'], 
//         battingStyle: mapList[index]['battingStyle'], 
//         bowlingStyle: mapList[index]['bowlingStyle'], 
//         playerName: mapList[index]['playerName'], 
//         playerImage: mapList[index]['playerImage'],
//       );
//     });
//   }

//   // DELETE DATA IN DATABASE
//   Future<void> deleteDataBaseCard(BatsmanModelClass obj)async {
//     final localDB = await database;

//     await localDB.delete(
//       "BatsmanData",
//       where: "id = ?",
//       whereArgs: [obj.id],
//     );
//     batsmanInfoList = await getData();
//     setState(() {});
//     print("Delete data successfully");
//   }

//   // UPDATE DATA IN DATABASE

//   Future<void> updateDataBase(BatsmanModelClass obj)async {
//     final localDB = await database;

//     await localDB.update(
//       "BatsmanData",
//       obj.mapPlayer(),
//       where: "id = ?",
//       whereArgs: [obj.id],
//     );
//     batsmanInfoList = await getData();
//     setState(() {});
//     print("update data successfully");
//   }

//   // void submit([BatsmanModelClass? batsmanModelClassObj]){
//   //   if(_playerNameController.text.trim().isNotEmpty &&
//   //     _countryController.text.trim().isNotEmpty){
//   //       setState(() {
//   //         batsmanModelClassObj!.playerName = _playerNameController.text;
//   //         batsmanModelClassObj.country = _countryController.text;
//   //         //batsmanModelClassObj.playerImage = _image;
//   //       });
//   //   }else{

//   //   }
//   // }

//   // File? _image ;
//   // final picker = ImagePicker();

//   // Future getImage()async{
//     // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   //    print(pickedFile)
//   //   setState(() {
//   //     if(pickedFile != null){
//   //       _image = File(pickedFile.path);
//   //     }else{
//   //       print("No File Selected");
//   //     }
//   //   });
//   // }

//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final TextEditingController _playerNameController = TextEditingController();
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _bornController = TextEditingController();
//   final TextEditingController _birthplaceController = TextEditingController();
//   final TextEditingController _nicknameController = TextEditingController();
//   final TextEditingController _roleController = TextEditingController();
//   final TextEditingController _battingstyleController = TextEditingController();
//   final TextEditingController _bowlingstyleController = TextEditingController();
//   final TextEditingController _playerimageController = TextEditingController();



//   void showBottomSheet(bool flag,[BatsmanModelClass? editIndex]){
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30.0),
//           topRight: Radius.circular(30.0),
//         ),
//       ),
//       isDismissible: true,
//       context: context, 
//       builder: (context){ 
//         return SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 top: 20,
//                 bottom: MediaQuery.of(context).viewInsets.bottom,
//               ), 
//               child: Column( 
//                 mainAxisSize: MainAxisSize.min,
//                 children: [ 
//                   // Image.asset(name)
//                   // Image.file(File(pickedFile.path))
//                   //const SizedBox(height: 40,),
//                   Column( 
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [ 
            
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Text(
//                           "Enter Batsman Info",
//                           style: GoogleFonts.quicksand(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 22,
//                           ),
//                         ),
//                       ),

//                       // 1 PLAYER IMAGE SELECT IN DEVICE
//                       Text(
//                         "IMAGE:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _playerimageController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter image url";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 2 PLAYER NAME STORE
//                       Text(
//                         "NAME:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _playerNameController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter name";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),                  
            
//                       // 3 PLAYER COUNTRY
//                       Text(
//                         "COUNTRY:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _countryController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter country";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 3 PLAYER BIRTHDATE(BORN)
//                       Text(
//                         "BORN:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _bornController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter born date";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 4 PLAYER BIRTHPLACE
//                       Text(
//                         "BIRTHPLACE:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _birthplaceController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter birthplace";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 5 PLAYER NICKNAME
//                       Text(
//                         "NICKNAME:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _nicknameController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter nickname";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 6 PLAYER ROLE
//                       Text(
//                         "ROLE:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _roleController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter role";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 7 PLAYER BATTING STYLE
//                       Text(
//                         "BATTING STYLE:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _battingstyleController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter batting style";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
//                       // 8 PLAYER BOWLING STYLE
//                       Text(
//                         "BOWLING STYLE:",
//                         style: GoogleFonts.quicksand(
//                           color: const Color.fromARGB(255, 5, 82, 146),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 3,
//                       ),
//                       TextFormField( 
//                         controller: _bowlingstyleController,
//                         decoration: InputDecoration( 
//                           focusedBorder: OutlineInputBorder( 
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: const BorderSide( 
//                               color: Colors.blue,
//                             ),
//                           ),
//                           border: OutlineInputBorder( 
//                             borderSide: const BorderSide( 
//                               color: Colors.black
//                             ),
//                             borderRadius: BorderRadius.circular(12), 
//                           )
//                         ),
//                         validator: (value) {
//                           if(value == null || value.trim().isEmpty){
//                             return "please enter bowling style";
//                           }else{
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 10,),
            
                      
//                       const SizedBox(height: 10,),
            
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             onPressed:(){
//                               flag? onSubmit(flag,editIndex): onSubmit(flag);
//                               //submit();
//                               Navigator.of(context).pop();
//                             } , 
//                             style: const ButtonStyle( 
//                               backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                               //iconColor: MaterialStatePropertyAll(Colors.blue),
//                               shadowColor: MaterialStatePropertyAll(Colors.black)
//                             ),
//                             child: Text(
//                               "Submit",
//                               style: GoogleFonts.quicksand( 
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white
//                               ),
//                             ) 
//                           ),
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ), 
//             ),
//           ),
//         );
//       }
//     );
//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.black,
//       appBar: AppBar( 
//         actions: const [ 
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Icon(Icons.search_outlined, color: Colors.white, size: 30,),
//           )
//         ],
//         title: Text(
//           "Batsman",
//           style: GoogleFonts.aBeeZee(
//             color: Colors.white,
//             fontWeight: FontWeight.w900,
//             fontSize:25,
//           ),
//         ),
//         centerTitle: true,
//         //backgroundColor: const Color.fromRGBO(1,87, 155, 1),
//         backgroundColor: Colors.black,
//       ),

//       body: ListView.builder(
//         itemCount: batsmanInfoList.length,
//         itemBuilder: (context, index){
//           return Slidable(
//             endActionPane: ActionPane(
//               extentRatio: 0.2,
//               motion: const DrawerMotion(),
//               dragDismissible: false,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [ 
//                       GestureDetector(
//                         onTap: () {
//                           // INDEX PASS FOR EDIT DATA IN LIST
//                           editTask(batsmanInfoList[index]);
//                         },
//                         child: Container(
//                           height: 32,
//                           width: 32,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 10,
//                                 color: Color.fromRGBO(0,0,0,0.1),
//                               ),
//                             ],
//                           ),
//                           child: const Icon(
//                             Icons.edit_outlined,
//                             color: Colors.black,
//                             //size: 20,
//                           ),
//                         ),
//                       ),
                  
//                       GestureDetector(
//                         onTap: () {
//                           // INDEX PASS TO DATABASE WHICH OBJECT DELETE IN DATABASE
//                           removeTask(batsmanInfoList[index]);
//                         },
//                         child: Container(
//                           height: 32,
//                           width: 32,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 blurRadius: 10,
//                                 color: Color.fromRGBO(0,0,0,0.1),
//                               ),
//                             ],
//                           ),
//                           child: const Icon(
//                             Icons.delete_outline_outlined,
//                             color: Colors.black,
//                             //size: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ], 
//             ),
//             child: Container(
//                   margin: const EdgeInsets.all(20),
//                   padding: const EdgeInsets.all(10),
//                   width: double.infinity,
//                   height: 100,
//                   decoration: const  BoxDecoration( 
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     boxShadow: [ 
//                       BoxShadow(offset: Offset(5, 5), 
//                         color: Color.fromARGB(255, 162, 207, 244)
//                       )
//                     ]
//                   ),
//                   child: Row(
//                     children: [
//                       // Container(
//                       //   height: 80,
//                       //   width: 80,
//                       //   decoration: const BoxDecoration( 
//                       //     shape: BoxShape.circle,
//                       //     color: Colors.white
//                       //   ),
//                       //   child: Padding(
//                       //     padding: const EdgeInsets.all(5),
//                       //     child: _image == null
//                       //       ? const Align(
//                       //           alignment: Alignment.center,
//                       //           child:  Text("No Image"),
//                       //         )
//                       //       : Image.file(batsmanInfoList[index].playerImage),
//                       //   ),
//                       // ),

//                       Container(
//                         height: 80,
//                         width: 80,
//                         decoration: const BoxDecoration( 
//                           shape: BoxShape.circle,
//                           color: Colors.white
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: Image.network(batsmanInfoList[index].playerImage)
//                         ),
//                       ),
//                       const SizedBox(width: 10,),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             batsmanInfoList[index].playerName,
//                             style: GoogleFonts.quicksand( 
//                               fontSize:20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text( 
//                             batsmanInfoList[index].country,
//                             style: GoogleFonts.quicksand( 
//                               fontSize:20,
//                               fontWeight: FontWeight.w300,
//                               color: Colors.black,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//           );
//         }
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//           _countryController.clear();
//           _bornController.clear();
//           _birthplaceController.clear();
//           _nicknameController.clear();
//           _roleController.clear();
//           _battingstyleController.clear();
//           _bowlingstyleController.clear();
//           _playerNameController.clear();
//           _playerimageController.clear();
//           showBottomSheet(false);
//         },
//         child: const Icon(Icons.add, size: 30 ,), 
//       ),
//     );
//   }

//   void editTask(BatsmanModelClass batsmanModelObj){
//     // ASSIGN THE TEXT EDITING CONTROLLERS WITH THE TEXT VALUES AND THEN OPEN THE BOTTOMSHEET

//     _countryController.text = batsmanModelObj.country;
//     _bornController.text = batsmanModelObj.born;
//     _birthplaceController.text = batsmanModelObj.birthPlace;
//     _nicknameController.text = batsmanModelObj.nickName;
//     _roleController.text = batsmanModelObj.role;
//     _battingstyleController.text = batsmanModelObj.battingStyle;
//     _bornController.text = batsmanModelObj.bowlingStyle;
//     _playerNameController.text = batsmanModelObj.playerName;

//     print(batsmanModelObj);
//     showBottomSheet(true,batsmanModelObj);
//   }

//   // REMOVE TASK
//   Future<void> removeTask(BatsmanModelClass obj)async {

//     await deleteDataBaseCard(obj);
//     setState(() {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Data delete successfully"),
//         backgroundColor: Color.fromARGB(255,76,149,175),
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _countryController.dispose();
//     _bornController.dispose();
//     _birthplaceController.dispose();
//     _nicknameController.dispose();
//     _roleController.dispose();
//     _battingstyleController.dispose();
//     _bowlingstyleController.dispose();
//     _playerNameController.dispose();
//     _playerimageController.dispose();
//   }

//   void onSubmit(bool flag,[BatsmanModelClass? editIndex])async {
//     bool enterData = _formkey.currentState!.validate();

//     if(
//       _countryController.text.trim().isNotEmpty &&
//       _bornController.text.trim().isNotEmpty &&
//       _birthplaceController.text.trim().isNotEmpty &&
//       _nicknameController.text.trim().isNotEmpty &&
//       _roleController.text.trim().isNotEmpty && 
//       _battingstyleController.text.trim().isNotEmpty && 
//       _bowlingstyleController.text.trim().isNotEmpty && 
//       _playerNameController.text.trim().isNotEmpty &&
//       _playerimageController.text.trim().isNotEmpty &&
//       enterData
//     ){
//       if(!flag){
//         await insertData(
//             BatsmanModelClass(
//               country: _countryController.text.trim(), 
//               born: _bornController.text.trim(), 
//               birthPlace: _birthplaceController.text.trim(), 
//               nickName: _nicknameController.text.trim(), 
//               role: _roleController.text.trim(), 
//               battingStyle: _battingstyleController.text.trim(), 
//               bowlingStyle: _bowlingstyleController.text.trim(), 
//               playerName: _playerNameController.text.trim(), 
//               playerImage: _playerimageController.text.trim(),
//             ),
//           );
//         setState(() async{
          
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Data add successfully"),
//               backgroundColor: Colors.green,
//             ),
//           );
//         });
//       }else{
//         await updateDataBase(
//             BatsmanModelClass(
//               id: editIndex!.id,
//               country: _countryController.text.trim(), 
//               born: _bornController.text.trim(), 
//               birthPlace: _birthplaceController.text.trim(), 
//               nickName: _nicknameController.text.trim(), 
//               role: _roleController.text.trim(), 
//               battingStyle: _battingstyleController.text.trim(), 
//               bowlingStyle: _bowlingstyleController.text.trim(), 
//               playerName: _playerNameController.text.trim(), 
//               playerImage: _playerimageController.text.trim(),
//             ),
//           );
//         setState(() async{
//           print("In updateddatabase");
          
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Data updated successfully"),
//               backgroundColor: Colors.green,
//             ),
//           );
//         });
//       }
//     }
//     clearController();
//   }

//   // CLEAR ALL TEXT EDITING CONTROLLER
//     void clearController(){
//       _countryController.clear();
//       _bornController.clear();
//       _birthplaceController.clear();
//       _nicknameController.clear();
//       _roleController.clear();
//       _battingstyleController.clear();
//       _bowlingstyleController.clear();
//       _playerNameController.clear();
//       _playerimageController.clear();
//     }
  
// }