//**Call Method**

class Parent{
	Parent(){
		print("In Parent Constructor");
		this();
	}
	
	call(){
		print("In Call Method");
	}
}

class Child extends Parent{
	Child(){
		print("In Child Constructor");
	}
}

void main(){
	Child obj = new Child();	//In Parent Constructor
					//In Call Method
					//In Child Constructor

	Parent obj2 = new Parent();	//In Parent Constructor
					//In Call Method

	obj2();				//In Call Method

	obj();				//In Call Method

	//Those who represents class are not callable (like super,object,this) to make them callable call method is here
	//If we make super,object,this callable by giving () then they goes to call method because they are not callable
}
