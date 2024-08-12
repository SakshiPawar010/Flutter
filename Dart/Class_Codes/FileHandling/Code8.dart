//Rename
//Read data in Range
//Write
//append

import "dart:io";

void main(){
	File f = new File("rename.txt");
	f.create();

	//Write
	f.writeAsStringSync("Welcome");
	print("Write");

	//append
	f.writeAsStringSync(" Course:Flutter" , mode: FileMode.append);
	print("Write(append)");
	
	//Read Data in Range
	String data = f.readAsStringSync().substring(0,10);
	print(data);

	f.renameSync("xyz.txt");
}
