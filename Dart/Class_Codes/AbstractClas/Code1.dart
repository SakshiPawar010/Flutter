//****Abstract Class****
//	There will be 0% to 100% abstraction in Abstract Class.

abstract class Parent{
	void property(){
		print("Gold, Bunglow, Flats, Cars");
	}
	void career();
	void marry();
}

class Child extends Parent{
	void career(){
		print("Developer");
	}
	void marry(){
		print("Rohit Saraf");
	}
}

void main(){
	//Parent obj = new Parent();	//Error: The class 'Parent' is abstract and can't be instantiated.(we can't make object of abstract class.)
	
	Parent obj = new Child();	//It works when we take Reference of parent & object of child.
	obj.career();
	obj.marry();
	obj.property();
}
