
import "dart:io";

void main() async{
	File f1 = new File("file.txt");
	File f2 = new File("sakshi.txt");
	f2.create();

	//Sync
	//f1.copySync(f2);	//ERROR
	f1.copySync(f2.path);

	//Async
}
