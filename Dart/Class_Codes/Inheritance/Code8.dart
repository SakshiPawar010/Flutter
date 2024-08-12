
class Parent {
	int x=10;
	String str="Sakshi";

	Parent(){
		print("In Parent Constructor.");
		print(this.hashCode);                //same as child
	}

	void parentMethod(){
		print(x);
		print(str);
	}
}

class Child extends Parent{
	int x=20;
	String str="Prajakta";

	Child(){
		print("In Child Constructor.");
		print(this.hashCode);              //same as parent
	}

	void childMethod(){
		print(x);
		print(str);
	}
}

void main(){
	Child obj = new Child();

	obj.parentMethod();
	obj.childMethod();	
}
