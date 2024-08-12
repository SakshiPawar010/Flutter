//Directory

import "dart:io";

void main() async{
	//-------Create Directory------
	
	//Directory dir = new Directory("FileHandling/Phase1");		//ERROR
	Directory dir = new Directory("Phase1");
	dir.create();

	Directory dir2 = new Directory("Phase1/Phase2");	//NO-ERROR
	dir2.create();

	print(dir.path);
	print(dir.absolute);

	print(dir2.path);
        print(dir2.absolute);

	//-----DELETE Directory-----

	//dir.delete();		//ERROR
	//dir.delete(recursive:true);	//NO-ERROR
}
