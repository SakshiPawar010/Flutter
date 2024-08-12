//Reading From File

import "dart:io";

void main(){
	File f = new File("file.txt");
	//f.create();

	//Sync
	String str = f.readAsStringSync();
	print(str);	

	//Async
	//Future<String> str = f.readAsString();
	//str.then((data)=> print(data));
}
