
class Parent{
	int x=10;
	String str="Sakshi";

	Parent(){
		print("In Parent Constructor.");
	}

	void parentMethod(){
		print(x);
		print(str);
	}
}

class Child extends Parent{
	int x=20;
	String str="Savani";

	Child(){
		print("In Child Constructor.");
	}

	void childMethod(){
		print(x);
		print(str);
	}
}

void main(){
	Parent obj1 = new Parent();
	Child obj2 = new Child();

	print(obj2.x);
	print(obj2.str);
	obj2.parentMethod();        //As the method of parent class is called on child object hence the output will be < 20 & Savani > == Nearest data from child 

	obj1.parentMethod();        //As method of parent class is called on parent object Hence the output will be < 10 & Sakshi >
}
