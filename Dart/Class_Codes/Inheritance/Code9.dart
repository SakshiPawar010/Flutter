//In Dart only super(); cannot able to call parent constructor & obj() also not possible. For calling constructor using super() & for obj(); it is mendatory to write call() method.

class Parent{
	Parent(){
		print("In Parent Constructor");
	}
}

class Child extends Parent{
	Child(){
		//super();                       //Error: Superclass has no method named 'call'.
		print("In Child Constructor");
	}
}

void main(){
	Child obj = new Child();
	//obj();                             //Error: The method 'call' isn't defined for the class 'Child'.
}
