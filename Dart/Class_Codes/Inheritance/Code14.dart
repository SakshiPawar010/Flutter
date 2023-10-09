//**Passing Arguments to Child Constructor**

class Parent{
	int? x;
	String? str;

	Parent(this.x,this.str);

	void printData(){
		print(x);
		print(str);
	}
}

class Child extends Parent{
	int? y;
	String? name;

	//Child(this.y,this.name);	//Error: The superclass, 'Parent', has no unnamed constructor that takes no arguments.
	
	//Child(this.y,this.name,int x,String str);	//Error: The superclass, 'Parent', has no unnamed constructor that takes no arguments.

	void dispData(){
		print(y);
		print(name);
	}
}

void main(){
	//Child obj = new Child(10,"Sakshi",);
	
	//Child obj = new Child(10,"Sakshi",20,"Shravani");
}
