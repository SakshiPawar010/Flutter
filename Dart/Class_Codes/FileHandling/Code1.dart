import "dart:io";

void main(){
	File f = new File("c2w.txt");
	print(f.runtimeType);
	f.create();		//File created when we going to visit the file
	//f.createSync();	//File created and then print line executed
	print("File Created");
}
