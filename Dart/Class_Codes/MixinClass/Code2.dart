
mixin DemoParent{
	void m1(){
		print("In m1-DemoParent");
	}
}

class Demo{
	void m1(){
		print("In m2-Demo");
	}
}

class ChildDemo extends Demo with DemoParent{

}

void main(){
	ChildDemo obj = new ChildDemo();
	obj.m1();	//In m1-DemoParent

	//When there are 2 methods with same name one in class and one in mixin class then preference is given to method of mixin class
}
