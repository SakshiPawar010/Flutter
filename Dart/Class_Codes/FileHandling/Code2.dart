
import "dart:io";

void main() async{
	File f = new File("demo.txt");
	print(f.runtimeType);
	await f.create();
	//print(f.createSync());	//EROOR
	print(f.create());
	print(f.absolute);
	print("File created");
}
