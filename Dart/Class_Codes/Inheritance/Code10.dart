
class Parent{
	Parent(){
		print("In Parent Constructor");
	}

	call(){
		print("In Method Call");
	}
}

class Child extends Parent{
	Child(){
		super();
		print("In Child Constructor");
	}
}

void main(){
	Child obj = new Child();
	obj();
}
