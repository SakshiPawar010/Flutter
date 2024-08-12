//In Inheritance parent(object) cannot access child variables/methods 
//Only child(object) can access all things of parent

class Parent{
	int x=10;
	String str1="name";

	void parentMethod(){
		print(x);
		print(str1);
	}
}

class Child extends Parent{
	int y=20;
	String str2="data";

	void childMethod(){
		print(y);
		print(str2);
	}
}

void main(){
	Parent obj1=new Parent();

	print(obj1.y);         //Error: The getter 'y' isn't defined for the class 'Parent'.
	print(obj1.str2);      //Error: The getter 'str2' isn't defined for the class 'Parent'.
	obj1.childMethod();    //Error: The method 'childMethod' isn't defined for the class 'Parent'.
}
