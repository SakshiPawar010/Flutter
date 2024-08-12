//****Mixin Class****
//	not interface nor a abstract class

mixin Parent{
	void m1(){
		print("In m1-Parent");
	}
}

class Demo{
	void m2(){
		print("In m2-Demo");
	}
}

class ChildDemo extends Demo with Parent{
	
}

void main(){
	ChildDemo obj = new ChildDemo();

        obj.m1();
        obj.m2();
}
