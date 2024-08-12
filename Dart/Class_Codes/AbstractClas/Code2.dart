//Constructor Scenario in abstract class

abstract class Demo{
	Demo(){
		print("In Demo Constructor");
	}

	void fun1(){
		print("In Fun1.");
	}
	void fun2();
}

class DemoChild extends Demo{
	DemoChild(){
		print("In DemoChild Constructor");
	}

	void fun2(){
		print("In Fun2.");
	}
}

void main(){
	DemoChild obj = new DemoChild();
	obj.fun1();
	obj.fun2();
}
