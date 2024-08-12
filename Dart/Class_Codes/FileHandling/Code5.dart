import "dart:io";

void main() async{
        File f = new File("file.txt");
        f.create();
        print(f.absolute);
        print(f.path);

        print(f.lastAccessed());
        print(f.lastModified());

        print(f.length());
        print(f.exists());

	//Sync
        print(f.lastModifiedSync());    //prints last

        //async1
        final data1 = await f.lastModified();
        print(data1);

        //aync2
        final value1 = f.lastModified();
        value1.then((val1)=> print(val1));
}
