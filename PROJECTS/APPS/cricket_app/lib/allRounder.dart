//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:cricket_app/batsman.dart';
import 'package:cricket_app/allRounderProfile.dart';

//import 'package:image_picker/image_picker.dart';

class AllRounder extends StatefulWidget {
  const AllRounder({super.key});

  @override
  State createState() => _AllRounderState();
}

class AllRounderModelClass {
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

  AllRounderModelClass({
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
  });

  Map<String, dynamic> mapPlayer() {
    return {
      'id': id,
      'country': country,
      'born': born,
      'birthPlace': birthPlace,
      'nickName': nickName,
      'role': role,
      'battingStyle': battingStyle,
      'bowlingStyle': bowlingStyle,
      'playerName': playerName,
      'playerImage': playerImage,
    };
  }

  @override
  String toString() {
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

class _AllRounderState extends State {
  @override
  void initState() {
    super.initState();
    initializedDatabase();
    print("Activated Database");
  }

  //dynamic database;
  List allRounderInfoList = [];

  // batsmanInfoList INITIALIZE BEFORE CALL FOR ACTIVEBASE
  // IN ACTIVEDATABASE DATABASE CREATE
  Future initializedDatabase() async {
    allRounderInfoList = await activeDatabase(); // DATA COPY
    setState(() {});
  }

  // DATABASE CREATE AND ACTIVATED
  Future<List<AllRounderModelClass>> activeDatabase() async {
    // try{
    //   database = openDatabase(
    //     path.join(await getDatabasesPath(), "CricketerInfo1.db"),
    //     version: 1,
    //     onCreate: (db, version) {

    //     },
    //   );
    // }catch(ie){
    //   print("Error opening database : $ie");
    // }
    List<AllRounderModelClass> initialList = await getData();
    return initialList;
  }

  // DATA INSERT INTO DATABASE
  Future<void> insertData(AllRounderModelClass obj) async {
    final localDB = await database;

    await localDB.insert(
      "AllRounderData",
      obj.mapPlayer(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    allRounderInfoList = await getData();
    setState(() {});
    print("Data inserted successfully");
  }

  // FETCH OR RETRIVE DATA IN DATABASE
  Future<List<AllRounderModelClass>> getData() async {
    final localDB = await database;
    print("Data Fetched Successfully");
    List<Map<String, dynamic>> mapList = await localDB.query("AllRounderData");
    return List.generate(mapList.length, (index) {
      return AllRounderModelClass(
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
  Future<void> deleteDataBaseCard(AllRounderModelClass obj) async {
    final localDB = await database;

    await localDB.delete(
      "AllRounderData",
      where: "id = ?",
      whereArgs: [obj.id],
    );
    allRounderInfoList = await getData();
    setState(() {});
    print("Delete data successfully");
  }

  // UPDATE DATA IN DATABASE

  Future<void> updateDataBase(AllRounderModelClass obj) async {
    final localDB = await database;

    await localDB.update(
      "AllRounderData",
      obj.mapPlayer(),
      where: "id = ?",
      whereArgs: [obj.id],
    );
    allRounderInfoList = await getData();
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
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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

  void showBottomSheet(bool flag, [AllRounderModelClass? editIndex]) {
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
        builder: (context) {
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
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Enter AllRounder Info",
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
                    TextField(
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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),

                    //     GestureDetector(
                    //       onTap: () {
                    //         getImage();
                    //       },
                    //       child: Container(
                    //         height: 50,
                    //         width: 50,
                    //         decoration: BoxDecoration(

                    //           shape: BoxShape.circle,
                    //           border: Border.all(color: Colors.black),
                    //         ),

                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter country";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter born date";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter birthplace";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter nickname";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter role";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter batting style";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

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
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          )),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "please enter bowling style";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              flag ? onSubmit(flag, editIndex) : onSubmit(flag);
                              //submit();
                              Navigator.of(context).pop();
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue),
                                //iconColor: MaterialStatePropertyAll(Colors.blue),
                                shadowColor:
                                    MaterialStatePropertyAll(Colors.black)),
                            child: Text(
                              "Submit",
                              style: GoogleFonts.quicksand(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ]),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
        title: Text(
          "AllRounder",
          style: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        //backgroundColor: const Color.fromRGBO(1,87, 155, 1),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: allRounderInfoList.length,
          itemBuilder: (context, index) {
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
                            editTask(allRounderInfoList[index]);
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
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
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
                            removeTask(allRounderInfoList[index]);
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
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
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
                  final passIndex = allRounderInfoList[index];
                  print(passIndex);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllRounderAllInfo(allRounderInfo: passIndex,),)
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  //height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 5),
                        color: Color.fromARGB(255, 162, 207, 244))
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
                            shape: BoxShape.circle, color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(allRounderInfoList[index].playerImage) ,
                              fit: BoxFit.fitHeight,
                              filterQuality: FilterQuality.high
                            ),                            
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allRounderInfoList[index].playerName,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            allRounderInfoList[index].country,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
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
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  void editTask(AllRounderModelClass allRounderModelObj) {
    // ASSIGN THE TEXT EDITING CONTROLLERS WITH THE TEXT VALUES AND THEN OPEN THE BOTTOMSHEET

    _countryController.text = allRounderModelObj.country;
    _bornController.text = allRounderModelObj.born;
    _birthplaceController.text = allRounderModelObj.birthPlace;
    _nicknameController.text = allRounderModelObj.nickName;
    _roleController.text = allRounderModelObj.role;
    _battingstyleController.text = allRounderModelObj.battingStyle;
    _bornController.text = allRounderModelObj.bowlingStyle;
    _playerNameController.text = allRounderModelObj.playerName;

    print(allRounderModelObj);
    showBottomSheet(true, allRounderModelObj);
  }

  // REMOVE TASK
  Future<void> removeTask(AllRounderModelClass obj) async {
    await deleteDataBaseCard(obj);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data delete successfully"),
          backgroundColor: Color.fromARGB(255, 76, 149, 175),
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

  void onSubmit(bool flag, [AllRounderModelClass? editIndex]) async {
    bool enterData = _formkey.currentState!.validate();

    if (_countryController.text.trim().isNotEmpty &&
        _bornController.text.trim().isNotEmpty &&
        _birthplaceController.text.trim().isNotEmpty &&
        _nicknameController.text.trim().isNotEmpty &&
        _roleController.text.trim().isNotEmpty &&
        _battingstyleController.text.trim().isNotEmpty &&
        _bowlingstyleController.text.trim().isNotEmpty &&
        _playerNameController.text.trim().isNotEmpty &&
        _playerimageController.text.trim().isNotEmpty &&
        enterData) {
      if (!flag) {
        await insertData(
          AllRounderModelClass(
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
        setState(() async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Data add successfully"),
              backgroundColor: Colors.green,
            ),
          );
        });
      } else {
        await updateDataBase(
          AllRounderModelClass(
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
        setState(() async {
          print("In updateddatabase");

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Data updated successfully"),
              backgroundColor: Colors.green,
            ),
          );
        });
      }
    }
    clearController();
  }

  // CLEAR ALL TEXT EDITING CONTROLLER
  void clearController() {
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

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:image_picker/image_picker.dart';

// class Batsman extends StatefulWidget{
//   const Batsman({super.key});

//   @override
//   State createState() => _BatsmanState();
// }

// class BatsmanModelClass{
//   String playerName;
//   File playerImage;
//   String playerInfo;

//   BatsmanModelClass(
//     {
//     required this.playerName,
//     required this.playerImage,
//     required this.playerInfo,
//     }
//   );
// }

// class _BatsmanState extends State{
//   List<List> batsmanInfoLList = [];

//   void submit([BatsmanModelClass? batsmanModelClassObj]){
//     if(playerNameController.text.trim().isNotEmpty &&
//       descriptionController.text.trim().isNotEmpty){
//         setState(() {
//           batsmanModelClassObj!.playerName = playerNameController.text;
//           batsmanModelClassObj.playerInfo = descriptionController.text;
//           //batsmanModelClassObj.playerImage = _image;
//         });
//     }else{

//     }
//   }

//   File? _image ;
//   final picker = ImagePicker();

//   Future getImage()async{
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if(pickedFile != null){
//         _image = File(pickedFile.path);
//       }else{
//         print("No File Selected");
//       }
//     });
//   }

//   TextEditingController playerNameController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();

//   void showBottomSheet(){
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
//           child: Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               top: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Enter Batsman Info",
//                   style: GoogleFonts.quicksand(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 22,
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Player Name:",
//                       style: GoogleFonts.quicksand(
//                         color: const Color.fromARGB(255, 5, 82, 146),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: playerNameController,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         )
//                       ),
//                     ),
//                     const SizedBox(height: 10,),

//                     Row(
//                       children: [
//                         Text(
//                           "Player Image:",
//                           style: GoogleFonts.quicksand(
//                             color: const Color.fromARGB(255, 5, 82, 146),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             getImage();
//                           },
//                           child: const Icon(Icons.add_a_photo_outlined)
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 10,),

//                     Text(
//                       "Information:",
//                       style: GoogleFonts.quicksand(
//                         color: const Color.fromARGB(255, 5, 82, 146),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: descriptionController,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         )
//                       ),
//                     ),
//                     const SizedBox(height: 10,),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed:(){
//                             setState(() {
//                               batsmanInfoLList.add([playerNameController.text,_image, descriptionController.text]);
//                             });
//                             //submit();
//                             Navigator.of(context).pop();
//                           } ,
//                           style: const ButtonStyle(
//                             backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                             //iconColor: MaterialStatePropertyAll(Colors.blue),
//                             shadowColor: MaterialStatePropertyAll(Colors.black)
//                           ),
//                           child: Text(
//                             "Submit",
//                             style: GoogleFonts.quicksand(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white
//                             ),
//                           )
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
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
//         itemCount: batsmanInfoLList.length,
//         itemBuilder: (context, index){
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(20),
//                 padding: const EdgeInsets.all(10),
//                 width: double.infinity,
//                 height: 100,
//                 decoration: const  BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   boxShadow: [
//                     BoxShadow(offset: Offset(5, 5), color: Color.fromARGB(255, 162, 207, 244))
//                   ]
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 80,
//                       decoration: const BoxDecoration(
//                         color: Colors.white
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: _image == null
//                           ? const Text("No Image")
//                           : Image.file(batsmanInfoLList[index][1]),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           batsmanInfoLList[index][0],
//                           style: GoogleFonts.quicksand(
//                             fontSize:20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           batsmanInfoLList[index][2],
//                           style: GoogleFonts.quicksand(
//                             fontSize:15,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               )
//             ],
//           );
//         }
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//           playerNameController.clear();
//           descriptionController.clear();
//           showBottomSheet();
//         },
//         child: const Icon(Icons.add, size: 30 ,),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:image_picker/image_picker.dart';

// class AllRounder extends StatefulWidget{
//   const AllRounder({super.key});

//   @override
//   State createState() => _AllRounderState();
// }

// class _AllRounderState extends State{

//   List<List> allRounderInfoLList = [];

//   TextEditingController playerNameController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();

//   File? _image ;
//   final picker = ImagePicker();

//   Future getImage()async{
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if(pickedFile != null){
//         _image = File(pickedFile.path);
//       }else{
//         print("No File Selected");
//       }
//     });
//   }

//   void showBottomSheet(){
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
//           child: Padding(
//             padding: EdgeInsets.only(
//               left: 20,
//               right: 20,
//               top: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Enter AllRounder Info",
//                   style: GoogleFonts.quicksand(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 22,
//                   ),
//                 ),
//                 const SizedBox(height: 20,),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Player Name:",
//                       style: GoogleFonts.quicksand(
//                         color: const Color.fromARGB(255, 5, 82, 146),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: playerNameController,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         )
//                       ),
//                     ),
//                     const SizedBox(height: 10,),

//                     Row(
//                       children: [
//                         Text(
//                           "Player Image:",
//                           style: GoogleFonts.quicksand(
//                             color: const Color.fromARGB(255, 5, 82, 146),
//                             fontWeight: FontWeight.w500,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             getImage();
//                           },
//                           child: const Icon(Icons.add_a_photo_outlined)
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 10,),

//                     Text(
//                       "Information:",
//                       style: GoogleFonts.quicksand(
//                         color: const Color.fromARGB(255, 5, 82, 146),
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextField(
//                       controller: descriptionController,
//                       decoration: InputDecoration(
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                           borderSide: const BorderSide(
//                             color: Colors.blue,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         )
//                       ),
//                     ),
//                     const SizedBox(height: 10,),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed:(){
//                             setState(() {
//                               allRounderInfoLList.add([playerNameController.text,_image, descriptionController.text]);
//                             });
//                             //submit();
//                             Navigator.of(context).pop();
//                           } ,
//                           style: const ButtonStyle(
//                             backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                             //iconColor: MaterialStatePropertyAll(Colors.blue),
//                             shadowColor: MaterialStatePropertyAll(Colors.black)
//                           ),
//                           child: Text(
//                             "Submit",
//                             style: GoogleFonts.quicksand(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white
//                             ),
//                           )
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         actions: const [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Icon(Icons.search_outlined, color: Colors.white, size: 30,),
//           )
//         ],
//         title: Text(
//           "AllRounder",
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
//         itemCount: allRounderInfoLList.length,
//         itemBuilder: (context, index){
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(20),
//                 padding: const EdgeInsets.all(10),
//                 width: double.infinity,
//                 height: 100,
//                 decoration: const  BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   boxShadow: [
//                     BoxShadow(offset: Offset(5, 5), color: Color.fromARGB(255, 162, 207, 244))
//                   ]
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 80,
//                       decoration: const BoxDecoration(
//                         color: Colors.white
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: _image == null
//                           ? const Text("No Image")
//                           : Image.file(allRounderInfoLList[index][1]),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           allRounderInfoLList[index][0],
//                           style: GoogleFonts.quicksand(
//                             fontSize:20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           allRounderInfoLList[index][2],
//                           style: GoogleFonts.quicksand(
//                             fontSize:15,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.white,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               )
//             ],
//           );
//         }
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//           playerNameController.clear();
//           descriptionController.clear();
//           showBottomSheet();
//         },
//         child: const Icon(Icons.add, size: 30 ,),
//       ),
//     );
//   }
// }

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // import 'package:image_picker/image_picker.dart';

// // class AllRounder extends StatefulWidget{
// //   const AllRounder({super.key});

// //   @override
// //   State createState() => _AllRounderState();
// // }

// // class _AllRounderState extends State{

// //   List<List> allRounderInfoLList = [];

// //   TextEditingController playerNameController = TextEditingController();
// //   TextEditingController descriptionController = TextEditingController();

// //   File? _image ;
// //   final picker = ImagePicker();

// //   Future getImage()async{
// //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// //     setState(() {
// //       if(pickedFile != null){
// //         _image = File(pickedFile.path);
// //       }else{
// //         print("No File Selected");
// //       }
// //     });
// //   }

// //   void showBottomSheet(){
// //     showModalBottomSheet(
// //       isScrollControlled: true,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(30.0),
// //           topRight: Radius.circular(30.0),
// //         ),
// //       ),
// //       isDismissible: true,
// //       context: context,
// //       builder: (context){
// //         return SingleChildScrollView(
// //           child: Padding(
// //             padding: EdgeInsets.only(
// //               left: 20,
// //               right: 20,
// //               top: 20,
// //               bottom: MediaQuery.of(context).viewInsets.bottom,
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   "Enter AllRounder Info",
// //                   style: GoogleFonts.quicksand(
// //                     fontWeight: FontWeight.w700,
// //                     fontSize: 22,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20,),
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       "Player Name:",
// //                       style: GoogleFonts.quicksand(
// //                         color: const Color.fromARGB(255, 5, 82, 146),
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 18,
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 3,
// //                     ),
// //                     TextField(
// //                       controller: playerNameController,
// //                       decoration: InputDecoration(
// //                         focusedBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                           borderSide: const BorderSide(
// //                             color: Colors.blue,
// //                           ),
// //                         ),
// //                         border: OutlineInputBorder(
// //                           borderSide: const BorderSide(
// //                             color: Colors.black
// //                           ),
// //                           borderRadius: BorderRadius.circular(12),
// //                         )
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10,),

// //                     Row(
// //                       children: [
// //                         Text(
// //                           "Player Image:",
// //                           style: GoogleFonts.quicksand(
// //                             color: const Color.fromARGB(255, 5, 82, 146),
// //                             fontWeight: FontWeight.w500,
// //                             fontSize: 18,
// //                           ),
// //                         ),
// //                         const SizedBox(
// //                           width: 10,
// //                         ),
// //                         GestureDetector(
// //                           onTap: () {
// //                             getImage();
// //                           },
// //                           child: const Icon(Icons.add_a_photo_outlined)
// //                         ),
// //                       ],
// //                     ),

// //                     const SizedBox(height: 10,),

// //                     Text(
// //                       "Information:",
// //                       style: GoogleFonts.quicksand(
// //                         color: const Color.fromARGB(255, 5, 82, 146),
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 18,
// //                       ),
// //                     ),
// //                     const SizedBox(
// //                       height: 3,
// //                     ),
// //                     TextField(
// //                       controller: descriptionController,
// //                       decoration: InputDecoration(
// //                         focusedBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                           borderSide: const BorderSide(
// //                             color: Colors.blue,
// //                           ),
// //                         ),
// //                         border: OutlineInputBorder(
// //                           borderSide: const BorderSide(
// //                             color: Colors.black
// //                           ),
// //                           borderRadius: BorderRadius.circular(12),
// //                         )
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10,),

// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         ElevatedButton(
// //                           onPressed:(){
// //                             setState(() {
// //                               allRounderInfoLList.add([playerNameController.text,_image, descriptionController.text]);
// //                             });
// //                             //submit();
// //                             Navigator.of(context).pop();
// //                           } ,
// //                           style: const ButtonStyle(
// //                             backgroundColor: MaterialStatePropertyAll(Colors.blue),
// //                             //iconColor: MaterialStatePropertyAll(Colors.blue),
// //                             shadowColor: MaterialStatePropertyAll(Colors.black)
// //                           ),
// //                           child: Text(
// //                             "Submit",
// //                             style: GoogleFonts.quicksand(
// //                               fontSize: 20,
// //                               fontWeight: FontWeight.w600,
// //                               color: Colors.white
// //                             ),
// //                           )
// //                         ),
// //                       ],
// //                     )
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ),
// //         );
// //       }
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 20),
// //             child: Icon(Icons.search_outlined, color: Colors.white, size: 30,),
// //           )
// //         ],
// //         title: Text(
// //           "AllRounder",
// //           style: GoogleFonts.aBeeZee(
// //             color: Colors.white,
// //             fontWeight: FontWeight.w900,
// //             fontSize:25,
// //           ),
// //         ),
// //         centerTitle: true,
// //         //backgroundColor: const Color.fromRGBO(1,87, 155, 1),
// //         backgroundColor: Colors.black,
// //       ),

// //       body: ListView.builder(
// //         itemCount: allRounderInfoLList.length,
// //         itemBuilder: (context, index){
// //           return Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Container(
// //                 margin: const EdgeInsets.all(20),
// //                 padding: const EdgeInsets.all(10),
// //                 width: double.infinity,
// //                 height: 100,
// //                 decoration: const  BoxDecoration(
// //                   color: Colors.blue,
// //                   borderRadius: BorderRadius.all(Radius.circular(20)),
// //                   boxShadow: [
// //                     BoxShadow(offset: Offset(5, 5), color: Color.fromARGB(255, 162, 207, 244))
// //                   ]
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     Container(
// //                       height: 80,
// //                       width: 80,
// //                       decoration: const BoxDecoration(
// //                         color: Colors.white
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(5),
// //                         child: _image == null
// //                           ? const Text("No Image")
// //                           : Image.file(allRounderInfoLList[index][1]),
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10,),
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           allRounderInfoLList[index][0],
// //                           style: GoogleFonts.quicksand(
// //                             fontSize:20,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                         Text(
// //                           allRounderInfoLList[index][2],
// //                           style: GoogleFonts.quicksand(
// //                             fontSize:15,
// //                             fontWeight: FontWeight.w300,
// //                             color: Colors.white,
// //                           ),
// //                         )
// //                       ],
// //                     )
// //                   ],
// //                 )
// //               )
// //             ],
// //           );
// //         }
// //       ),

// //       floatingActionButton: FloatingActionButton(
// //         onPressed:(){
// //           playerNameController.clear();
// //           descriptionController.clear();
// //           showBottomSheet();
// //         },
// //         child: const Icon(Icons.add, size: 30 ,),
// //       ),
// //     );
// //   }
// // }
