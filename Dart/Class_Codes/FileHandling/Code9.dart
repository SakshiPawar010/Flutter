//Delete

import "dart:io";

void main() async{
	//File f = new File("rename.txt");	//already exists
	//f.delete();

	File f = new File("rename.txt");
	if(f.existsSync()){
		f.delete();
		print("Delete");
	}else{
		print("File not found");
	}
}
